#include <gtest/gtest.h>
#include "lib.h"

TEST(LibTest, GetName) {
  EXPECT_EQ(lib::get_name(), "Damir!!!");
}