spf_template gnu &&
spf_url home  'http://www.mr511.de/software/english.html' &&
spf_url watch 'http://www.mr511.de/software/english.html' &&
spf_url src   "http://www.mr511.de/software/libelf-${spf_version?}.tar.gz" &&
spf_cc_ nls &&
spf_template_gnu_do_before_make() {
  sed -i 's/lib po/lib/' Makefile
} &&
spf_tested_version 0.8.13
