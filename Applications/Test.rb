require 'base'

module Test
  prj :ProjectB, :options => { :BUILD_WITH_A => true }
  prj :ProjectC
  prj :ProjectJ
end
