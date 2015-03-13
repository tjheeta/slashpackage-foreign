spf_template gnu &&
spf_url home  'http://git-scm.com/' &&
spf_url watch 'http://git-scm.com/download' &&
#spf_url src   "http://code.google.com/p/git-core/downloads/detail?name=git-${spf_version?}.tar.gz" &&
spf_url src   "https://www.kernel.org/pub/software/scm/git/git-${spf_version?}.tar.xz" &&
spf_cc_ cc_args -static &&
spf_depend zlib    &&
spf_depend sparse    &&
spf_depend curl    degree optional &&
#spf_depend expat   degree optional &&
spf_depend libressl degree optional &&
spf_args configure '--without-python' &&
spf_args configure '--without-tcltk' &&
case ${spf_version?} in
  1.5.*|1.6.[012345].*) :;;
  *)
    spf_data dir etc &&
    spf_args configure --with-gitconfig="${spf_path_prefix?}"/etc/gitconfig &&
    :;;
esac &&
spf_template_gnu_do_before_configure() {
  case ${spf_version?} in
    1.5.6.5|1.6.0.[12346]) prj_echo 'LDFLAGS = @LDFLAGS@' >> config.mak.in;;
    1.6.1) prj_sedfile configure 's/SAVE_LD_FLAGS/SAVE_LDFLAGS/';;
    *) :;;
  esac &&
  spf_args_cc="${spf_args_cpp?} ${spf_args_cc?}" &&
  spf_trigger_conf_libc &&
  if test -d "${spf_path_libc?}"/.; then
    prj_echo "SPARSE_FLAGS += -I${spf_path_libc?}/include" >> config.mak.in
  else :
  fi
} &&
spf_template_gnu_do_make() {
  perl_path=$(which perl) || ( echo "Need a working perl for git to install" && exit 1 )  &&
  PERL_PATH=${perl_path?} make 
} &&
#spf_tested_version 2.3.2 &&
spf_tested_version 1.9.5 &&
spf_tested_version 1.8.4 &&
spf_tested_version 1.7.5.1 &&
spf_tested_version 1.7.4 &&
spf_tested_version 1.7.3.2 &&
spf_tested_version 1.7.3.1 &&
spf_tested_version 1.7.1.1 &&
spf_tested_version 1.7.0.5 &&
spf_tested_version 1.6.6.1 &&
spf_tested_version 1.6.5.7 &&
spf_tested_version 1.6.5.6 &&
spf_tested_version 1.6.4.4 &&
spf_tested_version 1.6.4.3 &&
spf_tested_version 1.6.4.2 &&
spf_tested_version 1.6.3.3 &&
spf_tested_version 1.6.3.2 &&
spf_tested_version 1.6.3.1 &&
spf_tested_version 1.6.3 &&
spf_tested_version 1.6.2.1 &&
spf_tested_version 1.6.1.3 &&
spf_tested_version 1.6.1.2 &&
spf_tested_version 1.6.1.1 &&
spf_tested_version 1.6.1 &&
spf_tested_version 1.6.0.6 &&
spf_tested_version 1.6.0.4 &&
spf_tested_version 1.6.0.3 &&
spf_tested_version 1.6.0.2 &&
spf_tested_version 1.6.0.1 &&
spf_tested_version 1.5.6.5
