class LibPNG < Project
  c
  git 'http://git.code.sf.net/p/libpng/code'
  depend_on Zlib1
  cmake
end
