spf_template gnu &&
spf_url home  'ftp://ftp.gnupg.org/gcrypt/libgcrypt/' &&
spf_url watch 'ftp://ftp.gnupg.org/gcrypt/libgcrypt/' &&
spf_url src   "ftp://ftp.gnupg.org/gcrypt/libgcrypt/libgcrypt-${spf_version?}.tar.bz2" &&
spf_depend libgpg-error &&
case ${spf_version?} in
  1.2.*|1.4.[012345]) spf_cc_ nls;;
  *) :;;
esac &&
spf_args configure \
  --with-gpg-error-prefix="${spf_path_conf?}"/libgpg-error/prefix &&
spf_template_gnu_do_before_check() {
  prj_x2 prj_prepend LD_LIBRARY_PATH "${spf_path_conf?}"/libgpg-error/library
} &&
#pkg_before_configure_() {
#  prj_sedfile src/libgcrypt-config.in '
#/--prefix)/i\
#--prefix=*) prefix=$optarg;;\
#--exec-prefix=*) exec_prefix=$optarg;;\
#' #### report this
#}
spf_tested_version 1.4.6 &&
spf_tested_version 1.4.5 &&
spf_tested_version 1.4.4 &&
spf_tested_version 1.4.3 &&
spf_tested_version 1.4.2 &&
spf_tested_version 1.4.1 &&
spf_tested_version 1.4.0 &&
spf_tested_version 1.2.4 &&
spf_tested_version 1.2.3
