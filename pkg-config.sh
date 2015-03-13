spf_template gnu &&
spf_url home  'http://pkg-config.freedesktop.org/' &&
spf_url watch 'http://pkg-config.freedesktop.org/releases/' &&
spf_url src   "http://pkg-config.freedesktop.org/releases/pkg-config-${spf_version?}.tar.gz" &&
#https://bugs.freedesktop.org/show_bug.cgi?id=16101
#case ${spf_version?} in
#  0.2[12345]) :;;
#  *) spf_depend glib;;
#esac &&
spf_no_check &&
#spf_tested_version 0.26 &&
spf_tested_version 0.25 &&
spf_tested_version 0.23 &&
spf_tested_version 0.22 &&
spf_tested_version 0.21
