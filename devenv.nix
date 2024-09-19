{ pkgs, ... }:

let ruby = pkgs.ruby;
in {
  # https://devenv.sh/packages/
  packages =
    [ ruby pkgs.git pkgs.libyaml pkgs.mysql80 pkgs.pkg-config pkgs.openssl ];

  env = {
    BUNDLE_PATH = "./.devenv/bundle";
    GEM_HOME = "./.devenv/bundle/${ruby.rubyEngine}/${ruby.version.libDir}";
    GEM_PATH = "./.devenv/bundle/${ruby.rubyEngine}/${ruby.version.libDir}";
    BUNDLE_FORGET_CLI_OPTIONS = "true";
  };

  # https://devenv.sh/languages/
  # languages.nix.enable = true;

  # https://devenv.sh/pre-commit-hooks/
  # pre-commit.hooks.shellcheck.enable = true;

  # https://devenv.sh/processes/
  # processes.ping.exec = "ping example.com";

  # See full reference at https://devenv.sh/reference/options/
}
