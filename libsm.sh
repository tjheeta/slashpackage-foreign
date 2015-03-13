spf_template xorg &&
spf_template_xorg_section lib libSM &&
spf_depend xproto flags include &&
spf_depend xtrans flags include &&
spf_depend libice &&
case ${spf_version?} in
  1.0.*) :;;
  *) spf_depend e2fsprogs;;
esac &&
spf_tested_version 1.2.0 &&
spf_tested_version 1.1.1 &&
spf_tested_version 1.1.0 &&
spf_tested_version 1.0.3 &&
spf_tested_version 1.0.2
