{ defaultPlatformProject ? import ./default.nix {} }:

  defaultPlatformProject.propellor.project.hsPkgs.shellFor {
    # Include only the *local* packages of your project.
    packages = ps: with ps; [
      #pkga
      #pkgb
    ];

    # Builds a Hoogle documentation index of all dependencies,
    # and provides a "hoogle" command to search the index.
    withHoogle = true;

    # You might want some extra tools in the shell (optional).

    # Some common tools can be added with the `tools` argument
    #tools = { cabal = "3.2.0.0"; hlint = "2.2.11"; };
    tools = { };
    # See overlays/tools.nix for more details

    # Some you may need to get some other way.
    buildInputs = with defaultPlatformProject.pkgs;
      [ ghcid ];

    # Prevents cabal from choosing alternate plans, so that
    # *all* dependencies are provided by Nix.
    exactDeps = true;
}
