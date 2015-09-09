require 'base'

module Test
  prj :ProjectB, :version => '0.0.1', :options => { :BUILD_WITH_A => true }
  prj :ProjectC
  prj :ProjectJ
end
