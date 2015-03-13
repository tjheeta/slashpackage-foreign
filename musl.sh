spf_template gnu && 
spf_url home  'http://www.musl-libc.org/' &&
spf_url watch 'http://www.musl-libc.org/releases/' &&
spf_url src   "http://www.musl-libc.org/releases/musl-${spf_version?}.tar.gz" &&
spf_no_check &&
spf_template_gnu_do_before_install() {
  sh ${spf_path_compile?}/src/*/tools/musl-gcc.specs.sh ${spf_path_prefix?}/include ${spf_path_prefix?}/lib/ ${spf_path_prefix?}/lib/libc.so > /tmp/musl-gcc.specs

} && 
spf_template_gnu_do_after_install() {
  #sed -i "s%/lib/ld-musl-x86_64.so.1%${spf_path_prefix}/lib/libc.so%" "${spf_path_prefix?}"/lib/musl-gcc.specs 
  cp /tmp/musl-gcc.specs "${spf_path_prefix?}"/lib/musl-gcc.specs 
  gcc_path=`which gcc`
  cat <<EOF > /command/gcc-wrapper
#!/bin/sh
REALGCC=${gcc_path}
exec "\${REALGCC:-gcc}" "\$@" -specs "${spf_path_prefix}/lib/musl-gcc.specs"
EOF
  chmod 755 /command/gcc-wrapper
  cc_path=`which cc`
  cat <<EOF > /command/cc-wrapper
#!/bin/sh
REALCC=${cc_path}
exec "\${REALCC:-cc}" "\$@" -specs "${spf_path_prefix}/lib/musl-gcc.specs"
EOF
  chmod 755 /command/cc-wrapper
  ln -sf ${spf_path_prefix}/lib/libc.so /command/ldd 
} &&
spf_tested_version 1.1.6
