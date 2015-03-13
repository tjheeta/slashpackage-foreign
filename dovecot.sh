spf_template gnu &&
spf_url home  'http://www.dovecot.org' &&
spf_url watch 'http://www.dovecot.org/releases/2.2/' &&
spf_url src   "http://www.dovecot.org/releases/2.2/dovecot-${spf_version?}.tar.gz" &&
spf_depend zlib &&
spf_depend libressl &&
spf_template_gnu_do_before_configure() {
  # musl has no rpc.h, can't compile quota plugin
  # but old headers might be lying around the host
  prj_sedfile configure "s%rquota.x%no_rquota.x%"
} &&
spf_cc_ cpp_args -D_GNU_SOURCE &&
spf_args configure lib_cv_va_copy=yes &&
spf_args configure lib_cv___va_copy=no &&
spf_args configure lib_cv_va_val_copy=no &&
spf_args configure i_cv_posix_fallocate_works=no &&
spf_args configure i_cv_signed_size_t=no &&
spf_args configure i_cv_signed_time_t=yes &&
spf_args configure i_cv_mmap_plays_with_write=yes &&
spf_args configure i_cv_signed_size_t=yes &&
spf_args configure i_cv_c99_vsnprintf=yes &&
spf_args configure i_cv_fd_passing=yes  &&
spf_args configure --without-lzma &&
spf_args configure --without-gc &&
spf_args configure --without-bzlib &&
spf_tested_version 2.2.15

#spf_args configure i_cv_gmtime_max_time_t=31 &&
