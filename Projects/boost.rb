class Boost < Project
  
  cxx
  #git 'https://github.com/boostorg/boost.git', { :args => '--recursive' }
  wget 'https://downloads.sourceforge.net/project/boost/boost/%{version}/boost_%{major}_%{minor}_%{revision}.tar.gz', { :srcrename => 'boost_%{major}_%{minor}_%{revision}' }
  insource
  
  configure do
    run "#{build}/bootstrap.sh --prefix=#{prefix}"
  end
  
  build do
    variant = debug? ? 'debug' : 'release'
    run "#{build}/b2 variant=#{variant}"
  end
  
  install do
    # Something to do in debug to add a suffix
    variant = debug? ? 'debug' : 'release'
    run "#{build}/b2 install variant=#{variant}"
  end
  
end
