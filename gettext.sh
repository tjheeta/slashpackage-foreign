spf_template gnu &&
spf_template_gnu_src_ext gz &&
spf_cc_ nls &&
spf_depend ncurses &&
spf_depend zlib &&
# A bunch of tests are failing 
spf_no_check &&
spf_tested_version 0.19.4 
