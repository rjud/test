class ProjectA < Application
  git 'https://github.com/rjud/ProjectA.git'
  cmake
  redmine 'http://demo.redmine.org', 'projectc'
end
