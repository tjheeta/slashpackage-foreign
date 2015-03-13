spf_url home  'http://www.perl.com/' &&
spf_url watch 'http://www.perl.com/CPAN/src/' &&
spf_url src   "http://www.perl.com/CPAN/src/perl-${spf_version?}.tar.bz2" &&
spf_depend gdbm &&
case ${spf_version?} in
  5.8.*) :;;
#  *) spf_depend db degree optional;;
esac &&
spf_cc_ cpp_args &&
spf_cc_ cc_args &&
spf_cc_ ld_args &&
spf_cc_ make_args &&
spf_cc_ configure_args &&
spf_args configure -de &&
spf_args configure -Dprefix="${spf_path_prefix?}" &&
spf_args configure -Uinstallusrbinperl &&
spf_do_install() {
  spf_trigger_conf_libc &&
  if test -d "${spf_path_libc?}"/.; then
    spf_args configure -Aglibpth="${spf_path_libc?}"/library &&
    prj_u2 prj_capture pkg_libc prj_quote_sed : "${spf_path_libc?}" &&
    prj_sedfile ext/Errno/Errno_pm.PL "s:/usr\\(/include\\):${pkg_libc?}\\1:"
  else :
  fi &&
  prj_u2 prj_set pkg_path_inc '' &&
  prj_u2 prj_set pkg_path_lib '' &&
  prj_unset pkg_dep &&
  eval "set x ${spf_depend_list?}" && shift &&
  for pkg_dep in ${1+"$@"}; do {
    eval "set x ${pkg_dep?}" && shift &&
    pkg_dep=`prj_basename "$2"` &&
    prj_qlist_push pkg_path_inc "${spf_path_conf?}/${pkg_dep?}/include" &&
    prj_qlist_push pkg_path_lib "${spf_path_conf?}/${pkg_dep?}/library"
  } || return "$?"; done &&
  spf_args configure -Dlocincpth="${pkg_path_inc?}" &&
  spf_args configure -Dloclibpth="${pkg_path_lib?}" &&
  spf_args configure -Aprepend:cppflags="${spf_args_cpp?}" &&
  spf_args configure -Accflags="${spf_args_cpp?} ${spf_args_cc?}" &&
  spf_args configure \
    -Aprepend:ldflags="${spf_args_cpp?} ${spf_args_cc?} ${spf_args_ld?}" &&
  spf_args configure -Alddlflags="-shared ${spf_args_cc?} ${spf_args_ld?}" &&
  eval "./Configure ${spf_args_configure?}" &&
  case ${spf_version?} in
    5.8.8)
      prj_sedfile     makefile '/: <command-line>$/d' &&
      prj_sedfile x2p/makefile '/: <command-line>$/d' &&
      prj_sedfile ext/IPC/SysV/SysV.xs \
        's:^\( *# *include *<asm/page\.h> *\)$:/* \1 */:';;
    *) :;;
  esac &&
  eval "make ${spf_args_make?} all install" &&
  ( if test -d "${spf_path_libc?}"/.
      then cd "${spf_path_libc?}"/include
      else cd /usr/include
    fi &&
    "${spf_path_prefix?}"/bin/h2ph *.h &&
    set x [*]/ */ && shift &&
    if test "$1" = '[*]/' && test "$2" = '*/'
      then shift
      else :
    fi &&
    shift &&
    prj_unset pkg_dir &&
    for pkg_dir in ${1+"$@"}; do
      "${spf_path_prefix?}"/bin/h2ph "${pkg_dir?}"*.h || exit "$?"
    done
  ) &&
  chmod +x installhtml &&
  set ./installhtml --recurse --htmldir="${spf_path_prefix?}"/html \
    --libpods=perlfunc:perlguts:perlvar:perlrun:perlop \
    --splithead=pod/perlipc --splititem=pod/perlfunc &&
  "$@" &&
  "$@"
  ##cd pod; make tex; process-latex-files
} &&
spf_no_check &&
#spf_do_check() {
#  prj_x2 prj_set TZ UTC0 &&
#  make test
#  #### report: io/openpid.t fails if /bin/sh is pdksh
#} &&
spf_tested_version 5.14.0 &&
spf_tested_version 5.12.3 &&
spf_tested_version 5.12.2 &&
spf_tested_version 5.12.1 &&
spf_tested_version 5.12.0 &&
spf_tested_version 5.10.1 &&
spf_tested_version 5.8.9 &&
spf_tested_version 5.8.8
