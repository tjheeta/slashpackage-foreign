spf_template xorg &&
spf_template_xorg_section lib libXt &&
spf_depend xproto     flags include &&
spf_depend kbproto    flags include &&
spf_depend inputproto flags include &&
spf_depend libxdmcp &&
spf_depend libxau &&
spf_depend libxcb &&
spf_depend libx11 &&
spf_depend libice &&
spf_depend libsm &&
spf_depend e2fsprogs &&
case ${spf_version?} in
  1.0.5) ## http://bugs.freedesktop.org/show_bug.cgi?id=10556
    spf_template_gnu_do_before_configure() {
      prj_sedfile include/X11/VendorP.h '
1i\
#ifdef __cplusplus\
extern "C" {\
#endif\

$a\
#ifdef __cplusplus\
}\
#endif\

'
    };;
  *) :;;
esac &&
spf_tested_version 1.1.1 &&
spf_tested_version 1.0.9 &&
spf_tested_version 1.0.8 &&
spf_tested_version 1.0.7 &&
spf_tested_version 1.0.5 &&
spf_tested_version 1.0.4 &&
spf_tested_version 1.0.3
