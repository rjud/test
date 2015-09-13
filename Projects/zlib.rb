require 'tarball'

class Zlib1 < Project
  cxx
  wget 'http://zlib.net/zlib-%{version}.tar.gz', Tarball.new, { :srcrename => 'zlib-%{version}' }
  cmake
end
