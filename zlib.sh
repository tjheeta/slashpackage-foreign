spf_template sourceforge &&
spf_template_sourceforge_project libpng &&
spf_template_sourceforge_pid 5624 &&
spf_url home  'http://zlib.net/' &&
spf_url watch 'http://zlib.net/' &&
spf_url src   "http://zlib.net/zlib-${spf_version?}.tar.gz" &&
spf_depend musl &&
spf_cc_ cpp_args &&
spf_cc_ cc_args &&
spf_cc_ ld_args &&
spf_cc_ make_args &&
#spf_hack solaris_static_libgcc &&
spf_do_install() {
  spf_xesc SPF_CC_LDFLAGS  "${spf_args_ld?}"  '#' &&
  spf_xesc SPF_CC_CFLAGS   "${spf_args_cc?}"  '#' &&
  spf_xesc SPF_CC_CPPFLAGS "${spf_args_cpp?}" '#' &&
  prj_sedfile configure '
s:^\(LDFLAGS=.*\)":\1 ${SPF_CC_CFLAGS?} ${SPF_CC_LDFLAGS?}":
s:\(LDSHARED=.*\)":\1 ${SPF_CC_CFLAGS?} ${SPF_CC_LDFLAGS?}":
s:\(\${CFLAGS-".*\)"}:\1 ${SPF_CC_CPPFLAGS?} ${SPF_CC_CFLAGS?}"}:
s:^\(CPP=.*\)":\1 ${SPF_CC_CPPFLAGS?}":
' &&
  prj_unset CPP CFLAGS LDFLAGS &&
  prefix=${spf_path_prefix?} ./configure --shared &&
  eval "make ${spf_args_make?} all libz.a install" &&
  cp libz.a "${spf_path_prefix?}"/lib
} &&
spf_tested_version 1.2.8 &&
spf_tested_version 1.2.5 &&
spf_tested_version 1.2.4 &&
spf_tested_version 1.2.3 &&
spf_tested_version 1.2.2
