class OpenSceneGraph < Project
  cxx
  svn 'http://svn.openscenegraph.org/osg/OpenSceneGraph'
  cmake do
    option :GDAL_INCLUDE_DIR, :PATH, default: { :GDAL => :include_dir }
    option :GDAL_LIBRARY, :FILEPATH, default: { :GDAL => :library }
  end
end
