class Zlib1 < Project
  cxx
  wget 'http://zlib.net/zlib-%{version}.tar.gz', { :srcrename => 'zlib-%{version}' }
  cmake
end
