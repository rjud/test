class ProjectC < Project
  c
  git 'https://github.com/rjud/ProjectC.git'
  cmake
  depend_on ProjectB
end
