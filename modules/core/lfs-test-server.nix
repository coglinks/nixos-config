{ pkgs, ... }:

let
  lfs-test-server = pkgs.buildGoModule {
    pname = "lfs-test-server";
    version = "unstable";
    vendorHash = null;
    src = pkgs.fetchFromGitHub {
      owner = "git-lfs";
      repo = "lfs-test-server";
      rev = "b3e9808d367e52510f4111d6bf14657c7ae2856c";
      hash = "sha256-bvYiI+Md1QVxl0mQjmp21ePE9u/ykBroL1LZq4mWwbU=";
    };
  };
in
{
  environment.systemPackages = [
    lfs-test-server
  ];
}
