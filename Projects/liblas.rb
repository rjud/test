class LibLAS < Project
  cxx
  git 'https://github.com/libLAS/libLAS.git'
  depend_on Boost
  cmake
end
