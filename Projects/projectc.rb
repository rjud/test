class ProjectC < Project
  c
  git 'https://github.com/rjud/ProjectC.git'
  cmake
  depend_on ProjectB
  # Examples to change environment
  # Universal form
  binenv << -> { project(:ProjectB).bindir }
  # Avoid this form since auto-dependency can not detect this case
  # Simple form with a call to a function
  binenv << { :ProjectB => :bindir }
  # Complex form with a call to a function with several arguments
  libenv << { :ProjectB => [:libdir] }
  # Complex form with your own code
  libenv << { :ProjectB => -> prj { prj.libdir } }
end
