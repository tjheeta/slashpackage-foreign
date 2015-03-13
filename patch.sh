spf_template gnu &&
spf_template_gnu_src_ext gz &&
#spf_depend ed flags none degree optional &&
spf_template_gnu_do_before_check() { prj_x2 prj_set TZ UTC0; } &&
spf_tested_version 2.6.1 &&
spf_tested_version 2.6 &&
spf_tested_version 2.5.9 &&
spf_tested_version 2.5.4
