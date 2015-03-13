spf_template gnu &&
spf_url home  'http://www.multiprecision.org/' &&
spf_url watch 'http://www.multiprecision.org/index.php?prog=mpc&page=download' &&
spf_url src \
  "http://www.multiprecision.org/mpc/download/mpc-${spf_version?}.tar.gz" &&
spf_depend gmp &&
spf_depend mpfr &&
spf_args configure --with-gmp="${spf_path_conf?}"/gmp/prefix &&
spf_args configure --with-mpfr="${spf_path_conf?}"/mpfr/prefix &&
spf_tested_version 1.0.1 &&
spf_tested_version 0.9 &&
spf_tested_version 0.8.2
