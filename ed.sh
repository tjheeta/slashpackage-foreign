spf_template gnu &&
case ${spf_version?} in
  0.2) spf_template_gnu_src_ext gz;;
  0.3) spf_template_gnu_do_before_configure() {
         prj_sedfile testsuite/check.sh 's:if \$:if ./$:'
       };;
  *) :;;
esac &&
case ${spf_version?} in
  0.*|1.[01]) :;;
  *) spf_template_gnu_src_ext gz;;
esac &&
spf_tested_version 1.5 &&
spf_tested_version 1.4 &&
spf_tested_version 1.3 &&
spf_tested_version 1.2 &&
spf_tested_version 1.1 &&
spf_tested_version 1.0 &&
spf_tested_version 0.9 &&
spf_tested_version 0.8 &&
spf_tested_version 0.7 &&
spf_tested_version 0.6 &&
spf_tested_version 0.5 &&
spf_tested_version 0.3 &&
spf_tested_version 0.2
