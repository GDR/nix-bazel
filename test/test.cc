#include <spdlog/spdlog.h>
#include "test/proto/test.pb.h"

int main() {
  test::Test test;
  test.set_name("Damir!");
  spdlog::info("Hello, World! {}", test.name());
  
  return 0;
}