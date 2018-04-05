#!/bin/bash

REQUIRED_APPS="git aclocal automake autoconf emconfigure emmake em++"

check_apps () {
  local app flunked
  
  flunked=""
  for app in $( echo $REQUIRED_APPS ); do
    if ! which $app >/dev/null 2>&1; then
      echo "Required command, $app, not found in search path: $PATH"
      flunked="yes"
    fi
  done
  if [[ "$flunked" == "yes" ]]; then
    exit 1
  fi
}

case `uname` in
  Darwin*)
  libtoolize="glibtoolize"
  so="dylib"
  ;;

  *)
  libtoolize="libtoolize"
  so="so"
  ;;
esac

# generate configure file
pushd .
if [[ ! -d opencore-amr-code ]]; then
  git clone https://git.code.sf.net/p/opencore-amr/code opencore-amr-code
fi
if [[ ! -d opencore-amr-code ]]; then
  echo "opencore-amr-code directory not found"
  exit 1
fi
cd opencore-amr-code
${libtoolize} --force
aclocal
automake --force-missing --add-missing
autoconf -i
popd

# build with emscripten to get llvm bitcode.
pushd .
rm -rf build
mkdir -p build
cd build
emconfigure ../opencore-amr-code/configure --prefix=`pwd`
emmake make install
cp lib/libopencore-amrwb.${so} ../amrwb.bc
popd
