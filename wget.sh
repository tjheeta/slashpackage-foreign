spf_template gnu &&
spf_template_gnu_src_ext gz &&
spf_depend libressl degree optional &&
spf_depend zlib &&
spf_depend pkg-config &&
spf_cc_ cc_args -static
spf_cc_ nls &&
spf_args configure --with-ssl=openssl &&
spf_args configure --with-libssl-prefix="${spf_path_conf?}"/libressl/prefix &&
spf_data dir etc &&
spf_tested_version 1.16.3 &&
spf_tested_version 1.12 &&
spf_tested_version 1.11.4 &&
spf_tested_version 1.11.3 &&
spf_tested_version 1.11.2 &&
spf_tested_version 1.11.1 &&
spf_tested_version 1.11 &&
spf_tested_version 1.10.2
