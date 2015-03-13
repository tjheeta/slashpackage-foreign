spf_template gnu &&
spf_url home  'http://www.oracle.com/technology/products/berkeley-db/index.html' &&
spf_url watch 'http://www.oracle.com/technetwork/products/berkeleydb/downloads/index.html' &&
spf_url src   "http://download-east.oracle.com/berkeley-db/db-${spf_version?}.tar.gz" &&
spf_args configure --enable-compat185 &&
spf_args configure --enable-cxx &&
spf_srcdir "${spf_base?}-${spf_version?}"/build_unix &&
spf_template_gnu_dir ../dist &&
spf_template_gnu_do_before_configure() { prj_x2 prj_set SPF_GCC_GCCLIB ''; } &&
spf_template_gnu_do_after_install() {
  set "${spf_path_prefix?}"/include/db &&
  { test -d "$1"3/. || ln -s . "$1"3; } &&
  { test -d "$1"4/. || ln -s . "$1"4; }
} &&
spf_no_check && ## there are no tests
#spf_tested_version 5.2.36 && 
spf_tested_version 5.1.25 &&
spf_tested_version 5.1.19 &&
spf_tested_version 5.0.26 &&
spf_tested_version 5.0.21 &&
spf_tested_version 4.8.26 &&
spf_tested_version 4.8.24 &&
spf_tested_version 4.7.25 &&
spf_tested_version 4.6.21 &&
spf_tested_version 4.6.19 &&
spf_tested_version 4.6.18 &&
spf_tested_version 4.5.20 &&
spf_tested_version 4.4.20 &&
spf_tested_version 4.3.29
