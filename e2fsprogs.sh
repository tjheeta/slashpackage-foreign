spf_template gnu &&
spf_template sourceforge &&
spf_template_sourceforge_pid 2406 &&
spf_template_sourceforge_src_ext gz &&
spf_cc_ nls &&
spf_hack_self_rpath && #### report this
spf_srcdir "${spf_base?}-${spf_version?}"/build &&
spf_template_gnu_dir .. &&
spf_args configure --enable-fsck &&
spf_args configure --enable-elf-shlibs &&
spf_template_gnu_do_before_configure() {
  case ${spf_version?} in
    1.39|1.40.[12])
      prj_sedfile ../misc/Makefile.in 's:/etc:@prefix@/etc:g';;
    1.41.1)
      prj_sedfile ../misc/Makefile.in 's/LIBS_BLKID *=.*/& $(LIBCOM_ERR)/';;
    *) :;;
  esac &&
  case ${spf_version?} in
    1.39|1.40.*|1.41.?)
      spf_args configure --with-ldopts="${spf_args_ld?}";;
    *) :;;
  esac
} &&
spf_template_gnu_do_after_install() { make install-libs; } &&
case ${spf_version?} in
  1.41.0)
    spf_template_gnu_do_before_check() {
      prj_x2 prj_append LD_LIBRARY_PATH "${sp_path?}"/prefix/lib
    };;
  *) :;;
esac &&
spf_tested_version 1.41.14 &&
spf_tested_version 1.41.12 &&
spf_tested_version 1.41.11 &&
spf_tested_version 1.41.9 &&
spf_tested_version 1.41.7 &&
spf_tested_version 1.41.6 &&
spf_tested_version 1.41.5 &&
spf_tested_version 1.41.4 &&
spf_tested_version 1.41.3 &&
spf_tested_version 1.41.2 &&
spf_tested_version 1.41.1 &&
spf_tested_version 1.41.0 &&
spf_tested_version 1.40.11 &&
spf_tested_version 1.40.10 &&
spf_tested_version 1.40.8 &&
spf_tested_version 1.40.7 &&
spf_tested_version 1.40.5 &&
spf_tested_version 1.40.4 &&
spf_tested_version 1.40.3 &&
spf_tested_version 1.40.2 &&
spf_tested_version 1.39
