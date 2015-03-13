spf_template gnu &&
spf_url home  'http://www.pcre.org/' &&
spf_url watch 'ftp://ftp.csx.cam.ac.uk/pub/software/programming/pcre/' &&
spf_url src   "ftp://ftp.csx.cam.ac.uk/pub/software/programming/pcre/pcre-${spf_version?}.tar.bz2" &&
spf_cc_ configure_args '--enable-utf8 --enable-unicode-properties' &&
spf_tested_version 8.12 &&
spf_tested_version 8.10 &&
spf_tested_version 8.02 &&
spf_tested_version 8.01 &&
spf_tested_version 8.00 &&
spf_tested_version 7.9 &&
spf_tested_version 7.8 &&
spf_tested_version 7.7 &&
spf_tested_version 7.6 &&
spf_tested_version 7.4 &&
spf_tested_version 7.3 && #### breaks glib
spf_tested_version 7.2 &&
spf_tested_version 7.1 &&
spf_tested_version 7.0 &&
spf_tested_version 6.7
