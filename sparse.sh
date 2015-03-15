spf_url home  'http://kernel.org/pub/software/devel/sparse/' &&
spf_url watch 'http://www.kernel.org/pub/software/devel/sparse/dist/' &&
spf_url src   "http://www.kernel.org/pub/software/devel/sparse/dist/sparse-${spf_version?}.tar.xz" &&
spf_cc_ cpp_args &&
spf_cc_ cc_args &&
spf_cc_ ld_args &&
spf_cc_ make_args &&
#spf_depend libxml2 && 
spf_do_install() {
  prj_u2 prj_set pkg_edits 's/^\(CFLAGS *\)?=/\1=/' &&
  spf_edit_make_define pkg_edits CFLAGS "${spf_args_cpp?} ${spf_args_cc?}" &&
  prj_sedfile Makefile "${pkg_edits?}" &&
  set make PREFIX="${spf_path_prefix?}" \
    LDFLAGS="${spf_args_cc?} ${spf_args_ld?}" &&
  eval '${1+"$@"} '"${spf_args_make?} all install"
} &&
# sparse installs a binary - cgcc - looking for /usr/bin/perl - needed for git
#spf_tested_version 0.5.0 &&
spf_tested_version 0.4.4 &&
spf_tested_version 0.4.3 &&
spf_tested_version 0.4.2 &&
spf_tested_version 0.4.1
