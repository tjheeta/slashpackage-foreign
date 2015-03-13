spf_url src   "http://spf.relaxism.com/slashpackage-foreign/packages/kernel-headers-${spf_version?}.tar.xz" &&
spf_cc_ make_args &&
spf_do_install() {
  set ARCH=`arch`
  eval 'make "$@"' "${spf_args_make?} prefix=/ DESTDIR=${spf_path_prefix?} install"
} &&
spf_no_check &&
spf_tested_version 3.12.6-5
