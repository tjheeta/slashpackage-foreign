spf_template gnu &&
spf_url home  'http://ftp.gnu.org/gnu/readline/' &&
prj_u2 prj_capture pkg_version prj_sedarg1 's/^\([^.]*\.[^.]*\).*$/\1/' \
  "${spf_version?}" &&
spf_url watch \
  "http://ftp.gnu.org/gnu/readline/readline-${pkg_version?}-patches/" &&
spf_url watch_add 'http://ftp.gnu.org/gnu/readline/' &&
prj_u2 prj_capture pkg_ver_nodot prj_sedarg1 's/\.//' "${pkg_version?}" &&
spf_srcdir readline-"${pkg_version?}" &&
spf_url src \
  "http://ftp.gnu.org/gnu/readline/readline-${pkg_version?}.tar.gz" &&
if prj_match '*.*.[!0]*' "${spf_version?}" &&
   prj_not prj_match '*.*.*[!0123456789]*' "${spf_version?}"; then
  pkg_patches() {
    prj_unset pkg_i &&
    while prj_not prj_match "*.*.$#" "${spf_version?}"; do
      { set '' ${1+"$@"} &&
        pkg_i=`prj_sedarg1 's/^.*\(...\)$/\1/' 00"$#"` &&
        spf_url src_add \
          "http://ftp.gnu.org/gnu/readline/readline-${pkg_version?}-patches/readline${pkg_ver_nodot?}-${pkg_i}" \
          dir readline-"${pkg_version?}" fmt patch args 0
      } || return "$?"
    done
  } &&
  pkg_patches
else :
fi &&
spf_depend ncurses &&
case ${spf_version?} in
  *.*.*) spf_depend patch flags none;;
  *) :;;
esac &&
spf_args configure --with-curses &&
if test 5.0 = "${spf_version?}"; then
  spf_hack lib_links libhistory.so &&
  spf_hack lib_links libreadline.so
else :
fi &&
spf_template_gnu_do_after_install() {
  chmod +x "${spf_path_prefix?}"/lib/*.so
} &&
####case $spf_uname_s in
####  SunOS) prj_x2 prj_set SPF_GCC_GCCLIB '';;
####  NetBSD) spf_env_rpath=y;; ### LDFLAGS is passed to ld, not gcc, here
####  *) :;;
####esac
spf_tested_version 6.2.1 &&
spf_tested_version 6.1.2 &&
spf_tested_version 6.1.1 &&
spf_tested_version 6.0.4 &&
spf_tested_version 6.0.3 &&
spf_tested_version 6.0 &&
spf_tested_version 5.2.13 &&
spf_tested_version 5.2.12 &&
spf_tested_version 5.2.7 &&
spf_tested_version 5.2.4 &&
spf_tested_version 5.2.2 &&
spf_tested_version 5.2.1 &&
spf_tested_version 5.2 &&
spf_tested_version 5.1.4 &&
spf_tested_version 5.1.2 &&
spf_tested_version 5.1.1 &&
spf_tested_version 5.1 &&
spf_tested_version 5.0
