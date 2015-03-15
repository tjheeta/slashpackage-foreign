spf_tested_version 2.1.2 &&
spf_url home  'http://smarden.org/runit/install.html' &&
spf_url watch 'http://smarden.org/runit/install.html' &&
spf_url src   "http://smarden.org/runit/runit-${spf_version?}.tar.gz" &&
spf_cc_ cc_args -O2 -static &&
spf_cc_ ld_args -s -static &&
spf_cc_ make_args &&
spf_do_install() {
  cd ${spf_path_compile?}/src/admin/runit-${spf_version?} &&
  echo "gcc -O2 -Wall -static" > ./src/conf-cc && 
  echo "gcc -s -static" > ./src/conf-ld && 
  ./package/compile &&
  ./package/check  &&
  mkdir -p ${sp_path?}/command &&
  mkdir -p ${sp_path?}/prefix &&
  for i in `cat package/commands`; do
    cp command/$i ${sp_path?}/command
  done
} && 
spf_no_check
