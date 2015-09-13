class OpenSceneGraph < Project
  cxx
  svn 'http://svn.openscenegraph.org/osg/OpenSceneGraph'
  depend_on Curl
  depend_on GDAL
  depend_on LibLAS
  depend_on LibTIFF
  depend_on Zlib1
  depend_on LibJPEG
  cmake do
    if Platform.is_windows? then
      # Force it because CMake can't find it.
      option :JPEG_LIBRARY, :PATH, default: { :LibJPEG => :library }
    end
    option :FFMPEG_LIBAVCODEC_INCLUDE_DIRS, :PATH, default: -> { 'OFF' }
  end
  def libdir; prefix.join('lib').to_s; end
end
