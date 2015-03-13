spf_template gnu &&
spf_url home  'ftp://ftp.gnupg.org/gcrypt/libgpg-error/' &&
spf_url watch 'ftp://ftp.gnupg.org/gcrypt/libgpg-error/' &&
spf_url src   "ftp://ftp.gnupg.org/gcrypt/libgpg-error/libgpg-error-${spf_version?}.tar.bz2" &&
spf_cc_ nls &&
spf_tested_version 1.10 &&
spf_tested_version 1.9 &&
spf_tested_version 1.8 &&
spf_tested_version 1.7 &&
spf_tested_version 1.6 &&
spf_tested_version 1.5 &&
spf_tested_version 1.4
