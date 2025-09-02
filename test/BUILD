load("@rules_cc//cc:defs.bzl", "cc_binary")

cc_binary(
    name = "test",
    srcs = ["test.cc"],
    deps = [
        "@spdlog//:spdlog",
        "//test/proto:test_cc_proto",
        "//test/lib:lib",
    ],
)