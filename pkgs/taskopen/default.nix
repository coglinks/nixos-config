{
  lib,
  stdenv,
  fetchFromGitHub,
  makeWrapper,
  which,
  nim,
  git,
  perl,
  perlPackages,
}:

stdenv.mkDerivation {
  name = "taskopen";
  version = "2.0.0";

  src = fetchFromGitHub {
    owner = "jschlatow";
    repo = "taskopen";
    rev = "f70d75e459164caab7f5d156bbdbdcd85d0c1aea";
    hash = "sha256-CCPE8px6pR0xqwkfwewmULtxzf3KX1+X12FHmnuQ7qA=";
  };

  # Nim tries to write to ~/.cache/nim → forbidden
  NIM_CACHE_DIR = ".nimcache";

  postPatch = ''
    # We don't need a DESTDIR and an empty string results in an absolute path
    # (due to the trailing slash) which breaks the build.
    sed 's|$(DESTDIR)/||' -i Makefile

        # Replace git describe (both occurrences!) with a fixed version string
    sed -i "s|\$(shell git describe --tags --dirty)|f70d75e|" Makefile
    sed -i "s|\$(shell git describe)|f70d75e|" Makefile

    # Replace default editor (nano → vim)
    sed -i "s|-d:editor:'nano'|-d:editor:'vim'|" Makefile

    # Set a safe nimcache path
    sed -i "s|nim c |nim c --nimcache:$(NIM_CACHE_DIR) |" Makefile
  '';

  nativeBuildInputs = [
    nim
    git
    makeWrapper
  ];
  buildInputs = [
    which
  ]
  ++ (with perlPackages; [
    JSON
    perl
  ]);

  buildPhase = ''
    # this line removes a bug where value of $HOME is set to a non-writable /homeless-shelter dir
    export HOME=$(pwd)
  '';

  installPhase = ''
    make PREFIX=$out
    make PREFIX=$out install
  '';

  postFixup = ''
    wrapProgram $out/bin/taskopen \
         --set PERL5LIB "$PERL5LIB"
  '';

  meta = with lib; {
    description = "Script for taking notes and open urls with taskwarrior";
    mainProgram = "taskopen";
    homepage = "https://github.com/ValiValpas/taskopen";
    platforms = platforms.linux;
    license = licenses.gpl2Plus;
    maintainers = [ maintainers.winpat ];
  };
}
