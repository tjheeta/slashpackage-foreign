spf_template gnu &&
spf_url home  'http://tinc-vpn.org' &&
spf_depend libressl &&
spf_depend zlib &&
spf_depend lzo &&
spf_url watch 'http://tinc-vpn.org/download/' &&
spf_url src   "http://tinc-vpn.org/packages/tinc-${spf_version?}.tar.gz" &&
#spf_cc_ configure_args '--enable-utf8 --enable-unicode-properties' &&
spf_cc_ cc_args -static &&
spf_tested_version 1.0.25
