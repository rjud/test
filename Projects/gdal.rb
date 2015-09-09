class GDAL < Project
  
  cxx
  svn 'https://svn.osgeo.org/gdal', { :trustServerCert => true }
  autotools
  
  def srcdir bt; super.join 'gdal'; end
  def builddir bt; srcdir bt; end  
  
end
