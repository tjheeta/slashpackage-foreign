spf_template gnu &&
spf_url home  'http://www.python.org/' &&
spf_url watch 'http://www.python.org/ftp/python/' &&
spf_url src   "http://www.python.org/ftp/python/${spf_version?}/Python-${spf_version?}.tar.xz" &&
spf_depend bzip2    degree optional &&
spf_depend expat    degree optional &&
#spf_depend db       degree optional &&
spf_depend gdbm     degree optional &&
spf_depend ncurses  degree optional &&
spf_depend readline degree optional &&
spf_depend libressl  degree optional &&
spf_depend zlib     degree optional &&
#### tcl/tk
spf_srcdir Python-"${spf_version?}" &&
spf_args configure --enable-shared &&
spf_args configure --with-system-expat &&
spf_args configure --with-system-ffi &&
spf_args configure ac_cv_file__dev_ptmx=yes &&
spf_hack_self_rpath && #### report this
pkg_module() {
  : "${2?}" &&
  while test "$#" != 1; do
    { if test -d "${spf_path_conf?}/$1/."
        then :
        else return 0
      fi &&
      shift
    } || return "$?"
  done &&
  prj_echo "$1"
} &&
spf_template_gnu_do_before_configure() {
  prj_x2 prj_set SPF_GCC_GCCLIB '' &&
  { if test Linux = "${spf_uname_s?}"
      then echo 'crypt cryptmodule.c -lcrypt'
      else :
    fi &&
    pkg_module ncurses readline 'readline readline.c -lreadline -lncurses' &&
    pkg_module zlib 'zlib zlibmodule.c -lz'
  } > Modules/Setup.local &&
  case ${spf_version?} in
    2.7.7)  wget http://spf.relaxism.com/slashpackage-foreign/patches/python-includedirs.patch  
            wget http://spf.relaxism.com/slashpackage-foreign/patches/python-libressl.patch  
            wget http://spf.relaxism.com/slashpackage-foreign/patches/python-xcompile.patch  
            wget http://spf.relaxism.com/slashpackage-foreign/patches/python273-pathsearch.patch
             patch -p1 < python-includedirs.patch
             patch -p1 < python-libressl.patch
             patch -p1 < python-xcompile.patch
             patch -p1 < python273-pathsearch.patch ;;
           
    *) :;;
  esac && 
  case ${spf_version?} in
    2.5|2.5.1|2.5.2) prj_sedfile configure 's/LIBS="-lreadline /&-lncurses /';;
    *) :;;
  esac &&
  case ${spf_version?} in
    2.7|2.7.1|3.1.3) spf_args configure --with-dbmliborder=gdbm;;
    *) :;;
  esac &&
  case ${spf_version?}. in
    2.*|3.[01].*) :;;
    *) spf_args configure --with-system-expat;;
  esac
} &&
case ${spf_version?}. in
  2.7.7*) spf_template_gnu_do_before_make() { make Parser/pgen; } ;;
  3.0.*) spf_template_gnu_do_install() { make fullinstall; };;
  3.1.*|3.2.)
    spf_template_gnu_do_after_install() {
      ln -s idle3          "${spf_path_prefix?}"/bin/idle &&
      ln -s pydoc3         "${spf_path_prefix?}"/bin/pydoc &&
      ln -s python3        "${spf_path_prefix?}"/bin/python &&
      ln -s python3-config "${spf_path_prefix?}"/bin/python-config
    };;
  *) :;;
esac &&
#spf_template_gnu_do_after_install() {
#  prj_mkdir_p "${spf_path_prefix?}"/share/emacs/site-lisp &&
#  cp Misc/python-mode.el "${spf_path_prefix?}"/share/emacs/site-lisp
#} &&
spf_template_gnu_do_check() {
  prj_x2 prj_set TZ UTC0 &&
  for test in sqlite3/test email/test ctypes/test unittest/test lib-tk/test \
            bsddb/test json/tests lib2to3/tests distutils/tests test/test_time.py ; do
    rm -rvf "${spf_path_compile?}"/Lib/"$test"
  done
  make test EXTRATESTOPTS='-w'
} &&
spf_tested_version 3.2 &&
spf_tested_version 3.1.3 &&
spf_tested_version 3.1.2 &&
spf_tested_version 3.1.1 &&
spf_tested_version 3.1 &&
spf_tested_version 3.0.1 &&
spf_tested_version 3.0 &&
spf_tested_version 2.7.7 &&
spf_tested_version 2.7.3 &&
spf_tested_version 2.7.1 &&
spf_tested_version 2.7 &&
spf_tested_version 2.6.5 &&
spf_tested_version 2.6.4 &&
spf_tested_version 2.6.2 &&
spf_tested_version 2.6.1 &&
spf_tested_version 2.6 &&
spf_tested_version 2.5.2 &&
spf_tested_version 2.5.1 &&
spf_tested_version 2.5
