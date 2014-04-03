class Test < Application  
  app :ProjectB, :version => '0.0.1', :options => { :BUILD_WITH_A => true }
  app :ProjectC
end
