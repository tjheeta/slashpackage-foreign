spf_template gnu &&
spf_url home  'http://curl.haxx.se/' &&
spf_url watch 'http://curl.haxx.se/download/' &&
spf_url src   "http://curl.haxx.se/download/curl-${spf_version?}.tar.bz2" &&
spf_depend libressl degree optional &&
spf_depend zlib    degree optional &&
spf_cc_ cpp_args -D_GNU_SOURCE &&
spf_args configure --without-gnutls &&
spf_args configure --enable-ipv6 &&
spf_template_gnu_do_before_configure() {
  if test -d "${spf_path_conf?}"/libressl/.
    then spf_args configure --with-ssl="${spf_path_conf?}"/libressl/prefix
    else spf_args configure --without-ssl
  fi &&
  if test -d "${spf_path_conf?}"/zlib/.
    then spf_args configure --with-zlib="${spf_path_conf?}"/zlib/prefix
    else spf_args configure --without-zlib
  fi
} &&
spf_template_gnu_do_make() {
  make curl_LDFLAGS=-all-static
} &&
spf_template_gnu_do_before_check() { prj_x2 prj_set TZ UTC0; } &&
spf_no_check &&
spf_tested_version 7.39.0 &&
spf_tested_version 7.21.6 &&
spf_tested_version 7.21.3 &&
spf_tested_version 7.21.2 &&
spf_tested_version 7.21.1 &&
spf_tested_version 7.21.0 &&
spf_tested_version 7.20.1 &&
spf_tested_version 7.20.0 &&
spf_tested_version 7.19.7 &&
spf_tested_version 7.19.6 &&
spf_tested_version 7.19.5 &&
spf_tested_version 7.19.4 &&
spf_tested_version 7.19.3 &&
spf_tested_version 7.19.2 &&
spf_tested_version 7.19.0 &&
spf_tested_version 7.18.2 &&
spf_tested_version 7.18.1 &&
spf_tested_version 7.18.0 &&
spf_tested_version 7.17.1 &&
spf_tested_version 7.17.0 &&
spf_tested_version 7.16.4 &&
spf_tested_version 7.16.3 &&
spf_tested_version 7.16.2 &&
spf_tested_version 7.16.1 &&
spf_tested_version 7.16.0 &&
spf_tested_version 7.15.5
