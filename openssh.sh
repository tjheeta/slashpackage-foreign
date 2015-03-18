spf_template gnu &&
spf_url home  'http://www.openssh.org/' &&
spf_url watch 'ftp://ftp.openbsd.org/pub/OpenBSD/OpenSSH/portable/' &&
spf_url src   "ftp://ftp.openbsd.org/pub/OpenBSD/OpenSSH/portable/openssh-${spf_version?}.tar.gz" &&
spf_depend libressl &&
spf_depend zlib &&
spf_depend musl &&
#spf_depend xauth degree optional flags none when runtime &&
spf_cc_ cc_args -static -D_BSD_SOURCE -DMISSING_FD_MASK -DMISSING_NFDBITS &&
spf_cc default_path /command:/bin:/usr/bin:/usr/local/bin:/sbin:/usr/sbin \
  'The first line of this file specifies the $PATH value that will be set for
ssh login sessions.' &&
spf_data dir etc &&
#spf_args configure --without-pam && # linux-pam pwdb --with-pam
spf_args configure --with-ssl-dir="${spf_path_conf?}"/libressl &&
spf_args configure --with-zlib="${spf_path_conf?}"/zlib
spf_args configure --with-privsep-user=nobody &&
spf_args configure --with-privsep-path="${spf_path_prefix?}"/privsep &&
spf_args configure --with-md5-passwords &&
spf_args configure --with-shadow &&
spf_args configure --with-ldflags="${ld_args}" &&
spf_args configure --without-skey &&
spf_args configure --with-mantype=man &&
spf_args configure --disable-strip &&
spf_args configure --disable-lastlog &&
spf_args configure --disable-utmp &&
spf_args configure --disable-utmpx &&
spf_args configure --disable-wtmp &&
spf_args configure --disable-wtmpx &&
spf_args configure --disable-pututline &&
spf_args configure --disable-pututxline

spf_template_gnu_do_before_configure() {
  case ${spf_version?} in
    5.[568]p[12]) prj_x2 prj_set ossh_cv_utmp_h_has_ut_addr_v6 no;;
    *) :;;
  esac &&
  spf_args configure --with-default-path="${spf_ccv_default_path?}" &&
  mkdir "${spf_path_prefix?}" "${spf_path_prefix?}"/privsep &&
  if test -d "${spf_path_conf?}"/xauth/.
    then prj_u2 prj_set pkg_xauth "${spf_path_conf?}"/xauth/command/xauth
    else prj_u2 prj_which pkg_xauth xauth || prj_unset pkg_xauth
  fi &&
  if prj_is_set pkg_xauth
    then spf_args configure --with-xauth="${pkg_xauth?}"
    else :
  fi
} &&
spf_template_gnu_do_before_make() {
    mkdir netinet
    touch netinet/in_systm.h
    sed -i '/#include "includes.h"/a #include <sys\/param.h>' sshd.c
    sed -i '/USE_BTMP/d' config.h
    sed -i '/USE_UTMP/d' config.h
    sed -i 's@HAVE_DECL_HOWMANY 1@HAVE_DECL_HOWMANY 0@' config.h
} &&
spf_template_gnu_do_after_install() {
  #### Solaris arp doesn't understand -n; report this
  if test SunOS = "${spf_uname_s?}" &&
     test -f "${spf_path_prefix?}"/etc/ssh_prng_cmds; then
    prj_sedfile "${spf_path_prefix?}"/etc/ssh_prng_cmds 's%^\("arp .*-n\)%#\1%'
  else :
  fi
  rm -f "${spf_path_prefix?}"/etc/ssh*key*
} &&
spf_no_check && ## there are no tests
spf_tested_version 6.7p1 
