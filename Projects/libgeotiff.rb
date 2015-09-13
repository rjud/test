require 'libjpeg'
require 'libtiff'

class LibGeoTIFF < Project
  c
  svn 'https://svn.osgeo.org/metacrs/geotiff', { :trustServerCert => true }
  def @scm_tool.url_of_version v; @url + '/tags/libgeotiff-' + v; end
  depend_on LibJPEG
  depend_on LibTIFF
  depend_on Zlib1
  cmake do
    option :WITH_PROJ4, :BOOLEAN, default: -> { false }
    option :WITH_ZLIB, :BOOLEAN, default: -> { true }
    option :WITH_JPEG, :BOOLEAN, default: -> { true }
  end
end
