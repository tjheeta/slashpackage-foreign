spf_template djb &&
spf_tested_version 1.05 &&
spf_cc_ cc_args '-Wimplicit -Wunused -Wcomment -Wchar-subscripts -Wuninitialized -Wshadow -Wcast-qual -Wcast-align -Wwrite-strings' &&
spf_template_djb_do_before_install() {
  prj_sedfile hier.c '/c("\/"/s:.*:/*&*/:'
} &&
spf_template_djb_do_after_install() {
  mkdir "${spf_path_prefix?}"/etc &&
  cp dnsroots.global "${spf_path_prefix?}"/etc/
}
