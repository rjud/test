class GDAL < Project
  
  cxx
  svn 'https://svn.osgeo.org/gdal', { :trustServerCert => true }
  
  def srcdir bt; super.join('gdal'); end
  def builddir bt; srcdir bt; end
  
  if Platform.is_windows? then
    # Add options in an external make.opt
    def build_this bt;
      nmake = NMake.new
      cmd = '"' + nmake.path + '" -f makefile.vc'
      Platform.execute cmd, wd: (builddir bt)
    end
  else
    autotools do
      option '--with-libz', :PATH, default: { :Zlib1 => :prefix }
      option '--with-libtiff', :PATH, default: { :LibTIFF => :prefix }
      option '--with-geotiff', :PATH, default: { :LibGeoTIFF => :prefix }
      option '--with-jpeg', :PATH, default: { :LibJPEG => :prefix }
      option '--with-curl', :PATH, default: { :Curl => :prefix }
    end
  end
  
end
