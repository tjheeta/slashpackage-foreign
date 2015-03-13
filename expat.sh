spf_template gnu &&
spf_template sourceforge &&
spf_template_sourceforge_pid 10127 &&
spf_template_sourceforge_src_ext gz &&
spf_url home  'http://www.libexpat.org/' &&
case ${spf_version?} in
  2.0.0)
    spf_cc_ cpp_args -I"${spf_path_prefix?}"/include;;
  *) :;;
esac &&
spf_tested_version 2.1.0 &&
spf_tested_version 2.0.1 &&
spf_tested_version 2.0.0
