class Curl < Project
  c
  git 'https://github.com/bagder/curl.git'
  cmake
  depend_on Zlib1
end
