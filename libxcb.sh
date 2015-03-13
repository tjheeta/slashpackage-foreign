spf_template gnu &&
spf_url home  'http://xcb.freedesktop.org/' &&
spf_url watch 'http://xcb.freedesktop.org/dist/' &&
spf_url src \
  "http://xcb.freedesktop.org/dist/${spf_base?}-${spf_version?}.tar.bz2" &&
spf_depend libxslt          flags none &&
spf_depend xproto           flags include &&
spf_depend xcb-proto        flags include &&
spf_depend libpthread-stubs flags include &&
spf_depend libxau &&
spf_depend libxdmcp degree optional &&
spf_tested_version 1.7 &&
spf_tested_version 1.6
