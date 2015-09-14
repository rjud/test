require 'libpng'

class FreeType < Project
  c
  git 'http://git.savannah.gnu.org/r/freetype/freetype2.git'
  def @scm_tool.tag_of_version version
    v = Jud::Version.new version
    tag = "VER-#{v.major}-#{v.minor}"
    tag += "-#{v.release}" if not v.release.nil?
    tag
  end
  depend_on LibPNG
  depend_on Zlib1
  cmake
end
