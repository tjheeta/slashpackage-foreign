spf_template xorg &&
spf_template_xorg_section lib libXmu &&
spf_depend xproto     flags include &&
spf_depend kbproto    flags include &&
spf_depend inputproto flags include &&
spf_depend libxdmcp &&
spf_depend libxau &&
spf_depend libxcb &&
spf_depend libx11 &&
spf_depend xextproto  flags include &&
spf_depend libxext &&
spf_depend libice &&
spf_depend libsm &&
spf_depend libxt &&
spf_depend e2fsprogs &&
spf_tested_version 1.1.0 &&
spf_tested_version 1.0.5 &&
spf_tested_version 1.0.4 &&
spf_tested_version 1.0.3 &&
spf_tested_version 1.0.2
