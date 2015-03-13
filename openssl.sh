spf_url home  'http://www.openssl.org/' &&
spf_url watch 'http://www.openssl.org/source/' &&
spf_url src   "http://www.openssl.org/source/openssl-${spf_version?}.tar.gz" &&
spf_depend zlib &&
spf_depend musl &&
spf_data dir  ssl/certs &&
spf_data dir  ssl/private &&
spf_data file ssl/openssl.cnf &&
spf_cc_ cpp_args &&
spf_cc_ cc_args -O &&
spf_cc_ ld_args &&
spf_cc_ make_args &&
spf_cc config_args 'threads shared' 'The arguments on the first line of this file are passed to the config script.' &&
spf_link = man ssl/man &&
spf_hack_self_rpath &&
spf_do_install() {
  echo "HERE" &&
  env &&
  echo "DONE" &&
  set ./config --prefix="${spf_path_prefix?}" &&
  eval '"$@" '"${spf_ccv_config_args?}" &&
  prj_u2 prj_capture pkg_cflag \
    prj_quote_sed : "${spf_args_cpp?} ${spf_args_cc?} ${spf_args_ld?}" &&
  prj_u2 prj_capture pkg_ldflags \
    prj_quote_sed : "${spf_args_cc?} ${spf_args_ld?}" &&
  prj_sedfile Makefile "
s:^\(CFLAG *=.*\):\1 ${pkg_cflag?}:
s:^\(SHARED_LDFLAGS *=.*\):\1 ${pkg_ldflags?}:
" &&
  eval "make ${spf_args_make?} all install"
} &&
spf_do_check() { make check; } &&
spf_tested_version 1.0.2 &&
spf_tested_version 1.0.0d &&
spf_tested_version 1.0.0c &&
spf_tested_version 1.0.0b &&
spf_tested_version 1.0.0a &&
spf_tested_version 1.0.0 &&
spf_tested_version 0.9.8l &&
spf_tested_version 0.9.8k &&
spf_tested_version 0.9.8j &&
spf_tested_version 0.9.8i &&
spf_tested_version 0.9.8h &&
spf_tested_version 0.9.7m &&
spf_tested_version 0.9.7l &&
spf_tested_version 0.9.7k
