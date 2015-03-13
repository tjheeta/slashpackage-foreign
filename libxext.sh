spf_template xorg &&
spf_template_xorg_section lib libXext &&
spf_depend xproto     flags include &&
spf_depend kbproto    flags include &&
spf_depend inputproto flags include &&
spf_depend libxdmcp &&
spf_depend libxau &&
spf_depend libxcb &&
spf_depend libx11 &&
spf_depend xextproto  flags include &&
spf_tested_version 1.3.0 &&
spf_tested_version 1.2.0 &&
spf_tested_version 1.1.2 &&
spf_tested_version 1.1.1 &&
spf_tested_version 1.1 &&
spf_tested_version 1.0.5 &&
spf_tested_version 1.0.4 &&
spf_tested_version 1.0.3 &&
spf_tested_version 1.0.2
