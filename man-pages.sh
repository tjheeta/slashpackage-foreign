spf_url home  'http://www.kernel.org/pub/linux/docs/man-pages/' &&
spf_url watch 'http://www.kernel.org/pub/linux/docs/man-pages/' &&
spf_url src   "http://www.kernel.org/pub/linux/docs/man-pages/man-pages-${spf_version?}.tar.bz2" &&
spf_cc_ make_args &&
spf_do_install() {
  set prefix="${spf_path_prefix?}" &&
  eval 'make "$@" '"${spf_args_make?} install"
} &&
spf_no_check &&
spf_tested_version 3.42 &&
spf_tested_version 3.38 &&
spf_tested_version 3.37 &&
spf_tested_version 3.32 &&
spf_tested_version 3.31 &&
spf_tested_version 3.29 &&
spf_tested_version 3.28 &&
spf_tested_version 3.27 &&
spf_tested_version 3.25 &&
spf_tested_version 3.24 &&
spf_tested_version 3.23 &&
spf_tested_version 3.22 &&
spf_tested_version 3.21 &&
spf_tested_version 3.19 &&
spf_tested_version 3.17 &&
spf_tested_version 3.16 &&
spf_tested_version 3.15 &&
spf_tested_version 3.14 &&
spf_tested_version 3.13 &&
spf_tested_version 3.11 &&
spf_tested_version 3.08 &&
spf_tested_version 3.05 &&
spf_tested_version 3.01 &&
spf_tested_version 3.00 &&
spf_tested_version 2.79 &&
spf_tested_version 2.78 &&
spf_tested_version 2.77 &&
spf_tested_version 2.74 &&
spf_tested_version 2.70 &&
spf_tested_version 2.69 &&
spf_tested_version 2.67 &&
spf_tested_version 2.65 &&
spf_tested_version 2.64 &&
spf_tested_version 2.63 &&
spf_tested_version 2.62 &&
spf_tested_version 2.60 &&
spf_tested_version 2.55 &&
spf_tested_version 2.51 &&
spf_tested_version 2.48 &&
spf_tested_version 2.46 &&
spf_tested_version 2.44 &&
spf_tested_version 2.43 &&
spf_tested_version 2.42 &&
spf_tested_version 2.39
