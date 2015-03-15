spf_template gnu &&
spf_url home  'http://www.oberhumer.com/opensource/lzo/' &&
spf_url watch 'http://www.oberhumer.com/opensource/lzo/download/' &&
spf_url src   "http://www.oberhumer.com/opensource/lzo/download/lzo-${spf_version?}.tar.gz" &&
spf_depend zlib degree optional &&
spf_args configure --enable-shared &&
spf_tested_version 2.09 &&
spf_tested_version 2.05 &&
spf_tested_version 2.04 &&
spf_tested_version 2.03 &&
spf_tested_version 2.02
