spf_template gnu &&
spf_url home  'http://www.openssl.org/' &&
spf_url watch 'http://ftp.openbsd.org/pub/OpenBSD/LibreSSL/' &&
spf_url src   "http://ftp.openbsd.org/pub/OpenBSD/LibreSSL/libressl-${spf_version?}.tar.gz" &&
spf_depend zlib &&
spf_depend musl &&
spf_depend kernel-headers &&
spf_data dir  ssl/certs &&
spf_data dir  ssl/private &&
spf_data file ssl/openssl.cnf &&
spf_tested_version 2.1.6 &&
spf_tested_version 2.1.4
