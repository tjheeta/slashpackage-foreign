spf_template gnu &&
spf_url home  'http://x.org/' &&
spf_template_xorg_section() {
  if test "$#" = 1
    then set x "$1" "${spf_base?}" && shift
    else :
  fi &&
  spf_url watch "http://ftp.x.org/pub/individual/${1?}/" &&
  spf_url src \
    "http://ftp.x.org/pub/individual/${1?}/${2?}-${spf_version?}.tar.bz2" &&
  spf_srcdir "$2-${spf_version?}"
}
