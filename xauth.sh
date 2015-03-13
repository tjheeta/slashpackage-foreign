spf_template xorg &&
spf_template_xorg_section app &&
spf_depend xproto     flags include &&
spf_depend kbproto    flags include &&
spf_depend inputproto flags include &&
spf_depend libxdmcp &&
spf_depend libxau   &&
spf_depend libx11   &&
spf_depend xextproto flags include &&
spf_depend libxext  &&
spf_depend libxmu &&
spf_tested_version 1.0.5 &&
spf_tested_version 1.0.4 &&
spf_tested_version 1.0.3 &&
spf_tested_version 1.0.2 &&
spf_tested_version 1.0.1
