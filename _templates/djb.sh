spf_url home  "http://cr.yp.to/${spf_base?}.html" &&
spf_url watch "http://cr.yp.to/${spf_base?}/install.html" &&
spf_url src \
  "http://cr.yp.to/${spf_base?}/${spf_base?}-${spf_version?}.tar.gz" &&
spf_cc_ cpp_args &&
spf_cc_ cc_args -O2 &&
spf_cc_ ld_args -s &&
spf_cc_ make_args &&
spf_template_djb_do_before_install() { :; } &&
spf_template_djb_do_after_install()  { :; } &&
spf_do_install() {
  spf_template_djb_do_before_install &&
  spf_edit_1c conf-home "${spf_path_prefix?}" &&
  spf_edit_1c conf-cc "gcc ${spf_args_cpp?} ${spf_args_cc?}" &&
  spf_edit_1c conf-ld "gcc ${spf_args_cpp?} ${spf_args_cc?} ${spf_args_ld?}" &&
  if test -f error.h; then spf_hack_errno error.h; else :; fi &&
  eval "make ${spf_args_make?}" &&
  make setup check &&
  spf_template_djb_do_after_install
} &&
spf_do_check() { :; }
