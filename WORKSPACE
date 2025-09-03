# load the git_repository rule
load("@bazel_tools//tools/build_defs/repo:git.bzl", "git_repository")
load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")

# load rules_nixpkgs from master branch
git_repository(
    name = "io_tweag_rules_nixpkgs",
    remote = "https://github.com/tweag/rules_nixpkgs.git",
    branch = "master",
)

load("@io_tweag_rules_nixpkgs//nixpkgs:repositories.bzl", "rules_nixpkgs_dependencies")

rules_nixpkgs_dependencies()

load("@io_tweag_rules_nixpkgs//nixpkgs:nixpkgs.bzl", "nixpkgs_local_repository", "nixpkgs_cc_configure", "nixpkgs_python_configure")
nixpkgs_local_repository(
    name = "nixpkgs",
    nix_file = "//:nixpkgs.nix",
    nix_file_deps = ["//:flake.lock"],
)

nixpkgs_cc_configure(
  repository = "@nixpkgs",
  name = "nixpkgs_config_cc",
  nix_file_content = """
    with import <nixpkgs> { config = {}; overlays = []; };
    let
      clang = llvmPackages_20.clang;
    in
    buildEnv {
      name = "bazel-" + clang.name + "-wrapper";
      paths = [
        clang
        clang.bintools
      ] ++ lib.optional stdenv.isDarwin darwin.sigtool;
      pathsToLink = [ "/bin" ];
      passthru = {
        inherit (clang) isClang targetPrefix;
        orignalName = clang.name;
      };
      postBuild = lib.optionalString stdenv.isDarwin ''
        for tool in libtool objdump; do
           if [[ ! -e $$out/bin/$$tool ]]; then
             ln -s -t $$out/bin $${darwin.cctools}/bin/$$tool
           fi
        done
      '';
    }
  """
)

nixpkgs_python_configure(
  repository = "@nixpkgs",
  name = "nixpkgs_config_python",
)

# Hedron's Compile Commands Extractor for Bazel
# https://github.com/hedronvision/bazel-compile-commands-extractor
http_archive(
    name = "hedron_compile_commands",

    # Replace the commit hash (0e990032f3c5a866e72615cf67e5ce22186dcb97) in both places (below) with the latest (https://github.com/hedronvision/bazel-compile-commands-extractor/commits/main), rather than using the stale one here.
    # Even better, set up Renovate and let it do the work for you (see "Suggestion: Updates" in the README).
    url = "https://github.com/hedronvision/bazel-compile-commands-extractor/archive/0e990032f3c5a866e72615cf67e5ce22186dcb97.tar.gz",
    strip_prefix = "bazel-compile-commands-extractor-0e990032f3c5a866e72615cf67e5ce22186dcb97",
    # When you first run this tool, it'll recommend a sha256 hash to put here with a message like: "DEBUG: Rule 'hedron_compile_commands' indicated that a canonical reproducible form can be obtained by modifying arguments sha256 = ..."
)
load("@hedron_compile_commands//:workspace_setup.bzl", "hedron_compile_commands_setup")
hedron_compile_commands_setup()
load("@hedron_compile_commands//:workspace_setup_transitive.bzl", "hedron_compile_commands_setup_transitive")
hedron_compile_commands_setup_transitive()
load("@hedron_compile_commands//:workspace_setup_transitive_transitive.bzl", "hedron_compile_commands_setup_transitive_transitive")
hedron_compile_commands_setup_transitive_transitive()
load("@hedron_compile_commands//:workspace_setup_transitive_transitive_transitive.bzl", "hedron_compile_commands_setup_transitive_transitive_transitive")
hedron_compile_commands_setup_transitive_transitive_transitive()

