spf_template gnu &&
spf_cc_ nls &&
if test 1.15.1 = "${spf_version?}"; then
  spf_template_gnu_do_before_configure() {
    prj_x2 prj_set DEFAULT_RMT_COMMAND "${spf_path_prefix?}"/libexec/rmt &&
    prj_sedfile tests/genfile.c 's/static \(const char \*argp_program_\)/\1/'
  }
else :
fi &&
spf_tested_version 1.26 &&
spf_tested_version 1.25 &&
spf_tested_version 1.23 &&
spf_tested_version 1.22 &&
spf_tested_version 1.21 &&
spf_tested_version 1.20 &&
spf_tested_version 1.19 &&
spf_tested_version 1.18 &&
spf_tested_version 1.17 &&
spf_tested_version 1.16.1 &&
spf_tested_version 1.16 &&
spf_tested_version 1.15.1
