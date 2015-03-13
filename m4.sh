spf_template gnu &&
#case ${spf_version?} in
#  1.4.?|1.4.1[01]) :;;
#  *) spf_depend libsigsegv degree optional;;
#esac &&
spf_template_gnu_do_before_configure &&
spf_tested_version 1.4.16 &&
spf_tested_version 1.4.15 &&
spf_tested_version 1.4.14 &&
spf_tested_version 1.4.13 &&
spf_tested_version 1.4.12 &&
spf_tested_version 1.4.11 &&
spf_tested_version 1.4.10 &&
spf_tested_version 1.4.9 &&
spf_tested_version 1.4.8 &&
spf_tested_version 1.4.7 &&
spf_tested_version 1.4.6 &&
spf_tested_version 1.4.3
