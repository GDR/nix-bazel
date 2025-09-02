#include <spdlog/spdlog.h>
#include "test/proto/test.pb.h"
#include "test/lib/lib.h"

int main() {
  test::Test test;
  test.set_name(lib::get_name());
  spdlog::info("Hello, World! {}", test.name());
  
  return 0;
}