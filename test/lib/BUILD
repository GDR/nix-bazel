load("@rules_cc//cc:defs.bzl", "cc_library", "cc_test")

cc_library(
    name = "lib",
    srcs = ["lib.cc"],
    hdrs = ["lib.h"],
    visibility = ["//visibility:public"],
)

cc_test(
    name = "ut",
    srcs = ["ut.cc"],
    deps = [
        "@googletest//:gtest_main",
        "//test/lib:lib",
    ],
)
