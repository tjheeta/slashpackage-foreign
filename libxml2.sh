spf_template gnu &&
spf_url home  'http://xmlsoft.org/' &&
spf_url watch 'ftp://xmlsoft.org/libxml2/' &&
spf_url src   "ftp://xmlsoft.org/libxml2/libxml2-${spf_version?}.tar.gz" &&
spf_depend ncurses  &&
spf_depend readline &&
spf_depend zlib     &&
#case ${spf_version?}. in
#  2.6.*|2.7.[012345678].)
#    spf_depend python degree optional versions '2.*';;
#  *)
#    spf_depend python degree optional;;
#esac &&
spf_cc_ cc_args -D_GNU_SOURCE -fPIC
spf_srcdir libxml2-"${spf_version?}" &&
spf_args configure --with-history &&
spf_args configure --without-iconv &&
spf_args configure --without-iso8859x &&
spf_args configure --without-legacy &&
spf_link + include include/libxml2 &&
spf_template_gnu_do_before_configure() {
  if test -d "${spf_path_conf?}"/python/.
    then spf_args configure --with-python="${spf_path_conf?}"/python/prefix
    else spf_args configure --without-python 
  fi
} &&
spf_template_gnu_do_check() {
  make check &&
  make tests
} &&
spf_tested_version 2.9.1 &&
spf_tested_version 2.7.8 &&
spf_tested_version 2.7.7 &&
spf_tested_version 2.7.6 &&
spf_tested_version 2.7.4 &&
spf_tested_version 2.7.3 &&
spf_tested_version 2.7.2 &&
spf_tested_version 2.7.1 &&
spf_tested_version 2.7.0 &&
spf_tested_version 2.6.32 &&
spf_tested_version 2.6.31 &&
spf_tested_version 2.6.30 &&
spf_tested_version 2.6.29 &&
spf_tested_version 2.6.28 &&
spf_tested_version 2.6.27 &&
spf_tested_version 2.6.26
