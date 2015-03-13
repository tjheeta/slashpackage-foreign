spf_template gnu &&
spf_tested_version 1.8.3 &&
spf_template_gnu_src_ext gz &&
if test 1.8.3 = "${spf_version?}"; then
  spf_template_gnu_do_before_configure() {
    prj_sedfile Makefile.in \
      "s%^\(${spf_c_tab?}\$(INSTALL_DATA)\) -o \$(BINOWN) -g \$(BINGRP)%\1%"
  }
else :
fi &&
spf_template_gnu_do_after_install() { make install-compat; } &&
spf_no_check ## there are no tests
