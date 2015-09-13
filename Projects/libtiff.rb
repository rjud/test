require 'tarball'

class LibTIFF < Project
  
  c
  wget 'ftp://ftp.remotesensing.org/pub/libtiff/tiff-3.9.4.tar.gz', Tarball.new, { :srcrename => 'tiff-3.9.4' }
  
  if Platform.is_windows? then
    def builddir bt; srcdir bt; end 
    def build_this bt
      nmake = NMake.new
      cmd = '"' + nmake.path + '" -f makefile.vc'
      Platform.execute cmd, wd: (builddir bt)
    end
    def install_this bt
      Dir.chdir (srcdir bt).join('libtiff')
      # Headers
      FileUtils.mkdir_p prefix.join('include').to_s
      headers = ['tiff.h', 'tiffconf.h', 'tiffio.h', 'tiffvers.h']
      headers.each { |h| FileUtils.copy_file h, prefix.join('include', h).to_s }
      # Libraries
      FileUtils.mkdir_p prefix.join('lib').to_s
      FileUtils.copy_file 'libtiff.lib', prefix.join('lib', 'libtiff.lib').to_s
      # DLL
      FileUtils.mkdir_p prefix.join('bin').to_s
      FileUtils.copy_file 'libtiff.dll', prefix.join('bin', 'libtiff.dll').to_s
    end
  else
    autotools
  end
  
end
