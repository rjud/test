require 'projecta'

class ProjectB < Project
  
  c
  
  git 'https://github.com/rjud/ProjectB.git'
  
  cmake do
    option :BUILD_WITH_A, :BOOLEAN, desc: 'Build with A'
    option :ProjectA_DIR, :PATH, cond: :BUILD_WITH_A, default: { :ProjectA => -> p { p.prefix.join('share', 'projecta', 'cmake').to_s } }
  end
  
  ctest
  
  redmine 'http://demo.redmine.org', 'projectc'
  
end
