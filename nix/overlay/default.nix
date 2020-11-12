self: prev: { 
  #with builtins; map (p: ./.  + "/${p}") (filter (x: x != "default.nix" ) (attrNames (readDir /home/chenjf/projects/MY_PROJECT_NAME-static/nix/overlay)));
  libsodium = self.callPackage ./libsodium.nix {}; 
}
