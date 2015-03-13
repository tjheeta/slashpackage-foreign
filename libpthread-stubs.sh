spf_template gnu &&
spf_url home  'http://xcb.freedesktop.org/' &&
spf_url watch 'http://xcb.freedesktop.org/dist/' &&
spf_url src \
  "http://xcb.freedesktop.org/dist/${spf_base?}-${spf_version?}.tar.bz2" &&
spf_tested_version 0.3 &&
spf_tested_version 0.2 &&
spf_tested_version 0.1
