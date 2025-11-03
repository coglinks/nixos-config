{
  self,
  lib,
  inputs,
  ...
}:

{
  nixpkgs.overlays = [
    (
      final: prev:
      let
        cmakeCompatFix =
          pkg: brokenVersion:
          pkg.overrideAttrs (o: {
            cmakeFlags =
              (o.cmakeFlags or [ ])
              ++ lib.optional (
                brokenVersion || (lib.versionOlder o.version brokenVersion)
              ) "-DCMAKE_POLICY_VERSION_MINIMUM=3.5";
          });
      in
      {
        # BUGFIX: https://github.com/NixOS/nixpkgs/issues/449595
        qgnomeplatform = cmakeCompatFix prev.qgnomeplatform true;
        qgnomeplatform-qt6 = cmakeCompatFix prev.qgnomeplatform-qt6 true;
      }
    )
  ];
}
