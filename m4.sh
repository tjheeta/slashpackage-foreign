spf_template gnu &&
#case ${spf_version?} in
#  1.4.?|1.4.1[01]) :;;
#  *) spf_depend libsigsegv degree optional;;
#esac &&
spf_template_gnu_do_before_configure() {
  wget http://${spf_host?}/slashpackage-foreign/patches/gnulibfix &&
  chmod 755 gnulibfix &&
  ./gnulibfix lib &&
  printf "all:\n\ttrue\n\ninstall:\n\ttrue\n\n" > tests/Makefile.in
} &&
spf_args configure gl_cv_func_strtod_works=yes &&
spf_args configure gl_cv_func_vasprintf_posix=yes &&
spf_args configure gl_cv_func_printf_infinite_long_double=yes &&
spf_args configure gl_cv_func_printf_positions=yes &&
spf_cc_ cpp_args "-Drpl_strstr=strstr -Drpl_mkstemp=mkstemp -Drpl_readlink=readlink" &&
spf_no_check && # ./005.command_li:out ./109.changequot:out ./121.changecom:out are failing
spf_tested_version 1.4.16 &&
spf_tested_version 1.4.15 &&
spf_tested_version 1.4.14 &&
spf_tested_version 1.4.13 &&
spf_tested_version 1.4.12 &&
spf_tested_version 1.4.11 &&
spf_tested_version 1.4.10 &&
spf_tested_version 1.4.9 &&
spf_tested_version 1.4.8 &&
spf_tested_version 1.4.7 &&
spf_tested_version 1.4.6 &&
spf_tested_version 1.4.3
