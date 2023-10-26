cmake_minimum_required(VERSION 3.26)

project(cpp-nix
  VERSION 1.0
  LANGUAGES CXX)

find_package(Boost REQUIRED COMPONENTS system)

add_executable(cpp-nix src/main.cpp)
target_link_libraries(cpp-nix
  PRIVATE
  Boost::system)


option(TESTING "Enable tests." ON)

if(TESTING)
  enable_testing()
  add_subdirectory(test)
endif()

install(TARGETS cpp-nix DESTINATION bin)
