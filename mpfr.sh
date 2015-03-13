spf_template gnu &&
spf_url home  'http://www.mpfr.org/' &&
spf_url watch 'http://www.mpfr.org/mpfr-current/' &&
spf_url src \
  "http://www.mpfr.org/mpfr-${spf_version?}/mpfr-${spf_version?}.tar.bz2" &&
spf_depend gmp &&
spf_args configure --with-gmp="${spf_path_conf?}"/gmp/prefix &&
spf_tested_version 3.1.1 &&
spf_tested_version 3.1.0 &&
spf_tested_version 3.0.1 &&
spf_tested_version 3.0.0 &&
spf_tested_version 2.4.2 &&
spf_tested_version 2.4.1 &&
spf_tested_version 2.4.0 &&
spf_tested_version 2.3.2 &&
spf_tested_version 2.3.1
