spf_template gnu &&
spf_template_gnu_src_ext gz &&
spf_args configure --enable-overwrite &&
spf_args configure --with-shared &&
spf_hack self_rpath &&
####spf_depend gpm degree optional &&
case ${spf_uname_s?} in
  SunOS|NetBSD|FreeBSD) spf_env_rpath=y;; #### LDFLAGS for gcc vs. ld
  *) :;;
esac
spf_template_gnu_do_before_configure() {
  if test -d "${SPF_CONF?}"/gpm/.
    then spf_args configure --with-gpm
    else :
  fi
} &&
spf_template_gnu_do_after_install() {
  ln -s . "${spf_path_prefix?}"/include/ncurses &&
  case ${spf_version?} in
    5.[456]) chmod +x "${spf_path_prefix?}"/lib/*.so;;
    *) :;;
  esac &&
  set "${spf_path_prefix?}"/lib/libncursesw.* &&
  if test -f "$1"; then
    ( cd "${spf_path_prefix?}"/lib &&
      prj_unset pkg_wide pkg_nonwide &&
      set lib[*]w.so lib*w.so &&
      if test "$1 $2" = 'lib[*]w.so lib*w.so'
        then shift
        else :
      fi &&
      shift &&
      for pkg_wide in ${1+"$@"}; do
        { pkg_nonwide=`prj_sedarg1 's/w\.so$/.so/' "${pkg_wide?}"` &&
          ln -s "${pkg_wide?}" "${pkg_nonwide?}"
        } || return "$?"
      done &&
      set lib[*]w.a lib*w.a &&
      if test "$1 $2" = 'lib[*]w.a lib*w.a'
        then shift
        else :
      fi &&
      shift &&
      for pkg_wide in ${1+"$@"}; do
        { pkg_nonwide=`prj_sedarg1 's/w\.a/.a/' "${pkg_wide?}"` &&
          ln -s "${pkg_wide?}" "${pkg_nonwide?}"
        } || return "$?"
      done
    )
  else :
  fi
} &&
spf_no_check && ## there are no tests
spf_tested_version 5.9 &&
spf_tested_version 5.7 &&
spf_tested_version 5.6 &&
spf_tested_version 5.5 &&
spf_tested_version 5.4
