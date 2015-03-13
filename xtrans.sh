spf_template xorg &&
spf_template_xorg_section lib &&
case ${spf_version?} in
  1.2.5)
    spf_template_gnu_do_after_install() {
      ln -s share "${spf_path_prefix?}"/lib
    };;
  *) :;;
esac &&
spf_tested_version 1.2.6 &&
spf_tested_version 1.2.5 &&
spf_tested_version 1.2.4 &&
spf_tested_version 1.2.3 &&
spf_tested_version 1.2.2 &&
spf_tested_version 1.2.1 &&
spf_tested_version 1.2 &&
spf_tested_version 1.1 &&
spf_tested_version 1.0.4 &&
spf_tested_version 1.0.3 &&
spf_tested_version 1.0.2
