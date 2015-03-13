spf_template_gnu_src_ext() {
  spf_url src "http://ftp.gnu.org/gnu/${spf_base?}/${spf_base?}-${spf_version?}.tar.${1?}"
} &&
spf_url home  "http://www.gnu.org/software/${spf_base?}/" &&
spf_url watch "http://ftp.gnu.org/gnu/${spf_base?}/" &&
spf_template_gnu_src_ext bz2 &&
spf_cc_ cpp_args &&
spf_cc_ cxx_args &&
spf_cc_ cc_args &&
spf_cc_ ld_args &&
spf_cc_ configure_args &&
spf_cc_ make_args &&
prj_unset spf_template_gnu_dir_ &&
spf_template_gnu_dir() { spf_template_gnu_dir_=${1?}; } &&
spf_template_gnu_dir . &&
spf_template_gnu_build_sep() {
  spf_srcdir build &&
  spf_template_gnu_dir ../"${spf_base?}-${spf_version?}"
} &&
spf_template_gnu_x() {
  spf_args configure --x-includes="${spf_path_compile?}"/x-includes &&
  spf_args configure --x-libraries="${spf_path_compile?}"/x-libraries
} &&
spf_template_gnu_do_before_configure() { :; } &&
spf_template_gnu_do_configure() {
  prj_x2 prj_set CPPFLAGS "${spf_args_cpp?}" &&
  prj_x2 prj_set CXXFLAGS "${spf_args_cxx?}" &&
  prj_x2 prj_set CFLAGS   "${spf_args_cc?}"  &&
  prj_x2 prj_set LDFLAGS  "${spf_args_ld?}"  &&
  prj_echo CPPFLAGS="${spf_args_cpp?}" &&
  prj_echo CXXFLAGS="${spf_args_cxx?}" &&
  prj_echo   CFLAGS="${spf_args_cc?}"  &&
  prj_echo  LDFLAGS="${spf_args_ld?}"  &&
  prj_u2 prj_getstatus spf_template_gnu_had_libc \
    test -d "${spf_path_libc?}"/. &&
  prj_u2 prj_getstatus spf_template_gnu_had_gcc \
    test -d "${spf_path_conf?}"/gcc/. &&
  set SPF_GCC_GCCLIB=y RANDOM="$$" "${spf_template_gnu_dir_?}"/configure &&
  eval 'env "$@" '"${spf_args_configure?}" &&
  { test "${spf_template_gnu_had_libc?}" = 0 || rm -f "${spf_path_libc?}"; } &&
  { test "${spf_template_gnu_had_gcc?}"  = 0 || rm -f "${spf_path_conf?}"/gcc
  } &&
  set "${spf_path_conf?}"/[*] "${spf_path_conf?}"/* &&
  if test "$1 $2" = "${spf_path_conf?}/[*] ${spf_path_conf?}/*" &&
     test -d "${spf_path_conf?}"/.
    then rmdir "${spf_path_conf?}"
    else :
  fi
} &&
spf_template_gnu_do_before_make()    { :;                             } &&
spf_template_gnu_do_make()           { eval "make ${spf_args_make?}"; } &&
spf_template_gnu_do_before_install() { :;                             } &&
spf_template_gnu_do_install()        { make install;                  } &&
spf_template_gnu_do_after_install()  { :;                             } &&
spf_template_gnu_do_before_check()   { :;                             } &&
spf_template_gnu_do_check()          { make check;                    } &&
spf_template_gnu_do_after_check()    { :;                             } &&
spf_args configure --prefix="${spf_path_prefix?}" &&
spf_do_install() {
  if test n = "$spf_ccv_nls";  then spf_args configure --disable-nls
  elif prj_is_set spf_ccv_nls; then spf_args configure --enable-nls
  else :
  fi &&
  #prj_x2 prj_set CPP    'gcc -E' && 
  #prj_x2 prj_set CXXCPP 'g++ -E' && 
  spf_once spf_template_gnu_do_before_configure &&
  spf_once spf_template_gnu_do_configure        &&
  spf_once spf_template_gnu_do_before_make      &&
  spf_once spf_template_gnu_do_make             &&
  spf_once spf_template_gnu_do_before_install   &&
  spf_once spf_template_gnu_do_install          &&
  spf_once spf_template_gnu_do_after_install
} &&
spf_do_check() {
  spf_template_gnu_do_before_check &&
  spf_template_gnu_do_check        &&
  spf_template_gnu_do_after_check
}
