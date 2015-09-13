class LibJPEG < Project
  
  c
  wget 'http://sourceforge.net/projects/libjpeg/files/libjpeg/6b/jpegsrc.v6b.tar.gz/download', Tarball.new, { :srcrename => 'jpeg-6b' }
  
  if Platform.is_windows? then
    # Add a patch to add WIN32.MAK
    def builddir bt; srcdir bt; end 
    def configure_this bt
      Dir.chdir (srcdir bt)
      FileUtils.copy_file 'jconfig.vc', 'jconfig.h'
      FileUtils.copy_file 'makelib.ds', 'jpeg.mak'
      FileUtils.copy_file 'makeapps.ds', 'apps.mak'
    end
    def build_this bt
      nmake = NMake.new
      nodebug = bt == :Debug ? 0 : 1
      cmd = '"' + nmake.path + '"' + " /f makefile.vc nodebug=#{nodebug} libjpeg.lib"
      Platform.execute cmd, wd: (builddir bt)
    end
    def install_this bt
      # Library
      FileUtils.mkdir_p prefix.join('lib').to_s
      libname = if bt == :Debug then 'libjpegd.lib' else 'libjpeg.lib' end
      FileUtils.copy_file "libjpeg.lib", prefix.join('lib', libname).to_s
      # Headers
      FileUtils.mkdir_p prefix.join('include').to_s
      headers = ['jconfig.h', 'jerror.h', 'jmorecfg.h', 'jpeglib.h']
      headers.each do |h|
        FileUtils.copy_file h, prefix.join('include', h).to_s
      end
    end
    def library; prefix.join('lib', 'libjpeg.lib'); end
  else
    autotools
    install do |bt|
      cd prefix
      mkdir 'bin', 'man' + 'man1', 'include', 'lib'
      cd (builddir bt)
      make 'install'
      make 'install-lib'
    end
  end
  
end
