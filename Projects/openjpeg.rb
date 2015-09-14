class OpenJPEG < Project
  c
  git 'https://github.com/uclouvain/openjpeg.git'
  def @scm_tool.tag_of_version version; "version.#{version}"; end
  depend_on LibPNG
  depend_on LibTIFF
  depend_on Zlib1
  cmake
end
