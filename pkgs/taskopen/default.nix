{
  lib,
  stdenv,
  fetchFromGitHub,
  makeWrapper,
  which,
  perl,
  perlPackages,
}:

stdenv.mkDerivation rec {
  pname = "taskopen";
  version = "2.0.0";

  src = fetchFromGitHub {
    owner = "jschlatow";
    repo = "taskopen";
    rev = "f70d75e459164caab7f5d156bbdbdcd85d0c1aea";
    hash = "sha256-CCPE8px6pR0xqwkfwewmULtxzf3KX1+X12FHmnuQ7qA=";
  };

  postPatch = ''
    # We don't need a DESTDIR and an empty string results in an absolute path
    # (due to the trailing slash) which breaks the build.
    sed 's|$(DESTDIR)/||' -i Makefile
  '';

  nativeBuildInputs = [ makeWrapper ];
  buildInputs = [
    which
  ]
  ++ (with perlPackages; [
    JSON
    perl
  ]);

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
