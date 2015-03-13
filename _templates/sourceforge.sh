prj_u2 prj_set spf_template_sourceforge_project_ "${spf_base?}" &&
prj_u2 prj_set spf_template_sourceforge_base_ "${spf_base?}" &&
prj_u2 prj_set spf_template_sourceforge_path_ /"${spf_base?}" &&
prj_u2 prj_set spf_template_sourceforge_pid_ '' &&
prj_u2 prj_set spf_template_sourceforge_version_ "-${spf_version?}" &&
prj_u2 prj_set spf_template_sourceforge_src_archive_ .tar. &&
prj_u2 prj_set spf_template_sourceforge_src_ext_ bz2 &&
spf_template_sourceforge_urls_() {
  spf_url home "http://${spf_template_sourceforge_project_?}.sourceforge.net/" &&
  if test '' = "${spf_template_sourceforge_pid_?}"; then
    spf_url watch "http://sourceforge.net/projects/${spf_template_sourceforge_project_?}/files/"
#http://prdownloads.sourceforge.net/${spf_template_sourceforge_project_?}/
  elif test '' = "${spf_template_sourceforge_path_?}"; then
    spf_url watch "http://sourceforge.net/api/file/index/project-id/${spf_template_sourceforge_pid_?}/mtime/desc/limit/20/rss"
  else
    spf_url watch "http://sourceforge.net/api/file/index/project-id/${spf_template_sourceforge_pid_?}/mtime/desc/limit/20/rss?path=${spf_template_sourceforge_path_?}"
  fi &&
  spf_url src "http://downloads.sourceforge.net/${spf_template_sourceforge_project_?}/${spf_template_sourceforge_base_?}${spf_template_sourceforge_version_?}${spf_template_sourceforge_src_archive_?}${spf_template_sourceforge_src_ext_?}"
} &&
spf_template_sourceforge_urls_ &&
spf_template_sourceforge_project() {
  spf_template_sourceforge_project_=${1?} &&
  spf_template_sourceforge_urls_
} &&
spf_template_sourceforge_base() {
  spf_template_sourceforge_base_=${1?} &&
  spf_srcdir "${1?}-${spf_version?}" &&
  spf_template_sourceforge_urls_
} &&
spf_template_sourceforge_path() {
  spf_template_sourceforge_path_=${1?} &&
  spf_template_sourceforge_urls_
} &&
spf_template_sourceforge_pid() {
  spf_template_sourceforge_pid_=${1?} &&
  spf_template_sourceforge_urls_
} &&
spf_template_sourceforge_version() {
  spf_template_sourceforge_version_=${1?} &&
  spf_template_sourceforge_urls_
} &&
spf_template_sourceforge_src_archive() {
  spf_template_sourceforge_src_archive_=${1?} &&
  spf_template_sourceforge_urls_
} &&
spf_template_sourceforge_src_ext() {
  spf_template_sourceforge_src_ext_=${1?} &&
  spf_template_sourceforge_urls_
}
