spf_template xorg &&
spf_template_xorg_section lib libX11 &&
spf_depend xproto       flags include &&
spf_depend kbproto      flags include &&
spf_depend inputproto   flags include &&
spf_depend xextproto    flags include &&
spf_depend xcmiscproto  flags include &&
spf_depend bigreqsproto flags include &&
spf_depend xtrans       flags include &&
spf_depend libxdmcp &&
spf_depend libxau &&
case ${spf_version?} in
  1.0.3) :;;
  *) spf_depend libxcb;;
esac &&
spf_tested_version 1.4.3 &&
spf_tested_version 1.4.1 &&
spf_tested_version 1.4.0 &&
spf_tested_version 1.3.6 &&
spf_tested_version 1.3.4 &&
spf_tested_version 1.3.3 &&
spf_tested_version 1.3.2 &&
spf_tested_version 1.3 &&
spf_tested_version 1.2.2 &&
spf_tested_version 1.2.1 &&
spf_tested_version 1.2 &&
spf_tested_version 1.1.5 &&
spf_tested_version 1.1.4 &&
spf_tested_version 1.1.3 &&
spf_tested_version 1.1.2 &&
spf_tested_version 1.1.1 &&
spf_tested_version 1.0.3
