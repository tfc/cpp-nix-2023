include(CTest)

find_package(Catch2 REQUIRED)
include(Catch)

add_executable(cpp-nix-test
  main.cpp
  test.cpp
  )
target_compile_options(cpp-nix-test
  PRIVATE -Wall -Wextra -Werror)
target_link_libraries(cpp-nix-test Catch2::Catch2)

catch_discover_tests(cpp-nix-test)
