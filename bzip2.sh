spf_url home  'http://www.bzip.org/' &&
spf_url watch 'http://www.bzip.org/downloads.html' &&
spf_url src \
  "http://www.bzip.org/${spf_version?}/bzip2-${spf_version?}.tar.gz" &&
spf_cc_ cpp_args &&
spf_cc_ cc_args '-Wall -Winline -O2' &&
spf_cc_ ld_args &&
spf_cc_ make_args &&
spf_args cc '$(BIGFILES)' &&
case ${spf_version?} in
  1.0.[3456]) #### report this
    spf_hack_lib_links libbz2.so &&
    spf_hack_self_rpath;;
  *) :;;
esac &&
spf_do_install() {
  set x -f Makefile-libbz2_so \
    CFLAGS="${spf_args_cpp?} -fpic -fPIC ${spf_args_cc?} ${spf_args_ld?}" \
    LDFLAGS="${spf_args_ld?}" \
    PREFIX="${spf_path_prefix?}" && shift &&
  eval 'make "$@" '"${spf_args_make?} all" &&
  shift && shift && shift &&
  set CFLAGS="${spf_args_cpp?} ${spf_args_cc?}" "$@" &&
  eval 'make "$@" '"${spf_args_make?} clean all install" &&
  cp bzip2-shared "${spf_path_prefix?}"/bin/ &&
  cp libbz2.so.*.*.*  "${spf_path_prefix?}"/lib/
} &&
spf_tested_version 1.0.6 &&
spf_tested_version 1.0.5 &&
spf_tested_version 1.0.4 &&
spf_tested_version 1.0.3
