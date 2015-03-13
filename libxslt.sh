spf_template gnu &&
spf_url home  'http://xmlsoft.org/XSLT/' &&
spf_url watch 'ftp://xmlsoft.org/libxslt/' &&
spf_url src   "ftp://xmlsoft.org/libxslt/libxslt-${spf_version?}.tar.gz" &&
spf_depend libgpg-error degree optional &&
spf_depend libgcrypt    degree optional &&
spf_depend libxml &&
spf_depend zlib &&
#spf_args configure --with-libxml-prefix="${spf_path_conf?}"/libxml/command &&
spf_args configure --with-libxml-include-prefix="${spf_path_conf?}"/libxml/include &&
spf_args configure --with-libxml-libs-prefix="${spf_path_conf?}"/libxml/library &&
spf_template_gnu_do_before_configure() {
  if test -d "${spf_path_conf?}"/libgcrypt/.
    then spf_args configure --with-crypto
    else spf_args configure --without-crypto
  fi
} &&
spf_tested_version 1.1.26 &&
spf_tested_version 1.1.25 &&
spf_tested_version 1.1.24 &&
spf_tested_version 1.1.22 &&
spf_tested_version 1.1.21 &&
spf_tested_version 1.1.20
