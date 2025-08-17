{ pkgs, ... }:

pkgs.stdenv.mkDerivation {
  name = "sddm-theme";
  src = pkgs.fetchFromGitHub {
    owner = "Keyitdev";
    repo = "sddm-astronaut-theme";
    rev = "22bbb5ef3008756357433c61cb4444d742fd09c9";
    hash = "sha256-+PghFV+EK6zcAoAxzTUc5DRpqeSAlP2/m2nYcHZFWDo=";
  };
#The following does not work
  #patchPhase = ''
  #  find . -type f -name "metadata.desktop" -print0 | xargs -0 sed -i -e 's|ConfigFile=Themes/astronaut.conf|ConfigFile=Themes/pixel_sakura.conf|g'
  #'';
  installPhase = ''
    mkdir -p $out
    cp -R ./* $out/
  '';
}
