class OsgEarth < Project
  cxx
  git 'https://github.com/gwaldron/osgearth.git'
  cmake do
    option :GEOS_INCLUDE_DIR, :PATH, default: -> { 'OFF' }
  end
  depend_on Curl
  depend_on GDAL
  depend_on OpenSceneGraph
  depend_on Zlib1
  libenv << { :OpenSceneGraph => :libdir }
end
