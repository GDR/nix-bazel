# load the git_repository rule
load("@bazel_tools//tools/build_defs/repo:git.bzl", "git_repository")

# load rules_nixpkgs from master branch
git_repository(
    name = "io_tweag_rules_nixpkgs",
    remote = "https://github.com/tweag/rules_nixpkgs.git",
    branch = "master",
)

load("@io_tweag_rules_nixpkgs//nixpkgs:repositories.bzl", "rules_nixpkgs_dependencies")

rules_nixpkgs_dependencies()

load("@io_tweag_rules_nixpkgs//nixpkgs:nixpkgs.bzl", "nixpkgs_local_repository", "nixpkgs_cc_configure")
nixpkgs_local_repository(
    name = "nixpkgs",
    nix_file = "//:nixpkgs.nix",
    nix_file_deps = ["//:flake.lock"],
)

nixpkgs_cc_configure(
  repository = "@nixpkgs",
  name = "nixpkgs_config_cc",
  nix_file_content = "(import <nixpkgs> {}).llvmPackages_20.clang"
)