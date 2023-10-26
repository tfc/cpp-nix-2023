#include <catch2/catch.hpp>

SCENARIO("basic math", "[basics]") {
  GIVEN("addition works") {
    WHEN("1 + 1 = 2") {
      REQUIRE(1 + 1 == 2);
    }
  }
}
