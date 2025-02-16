{ pkgs, cursor, ... }:

let
  getFrom = url: hash: name: {
    gtk.enable = true;
    x11.enable = true;
    name = name;
    size = 48;
    package = pkgs.runCommand "moveUp" { } ''
      	    mkdir -p $out/share/icons
      	    ln -s ${pkgs.fetchzip {
      	      url = url;
      	      hash = hash;
      	    }} $out/share/icons/${name}
    '';
  };
in
getFrom
  cursor.url
  cursor.hash
  cursor.name
  

