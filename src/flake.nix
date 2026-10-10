{
  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

  outputs = {
    self,
    nixpkgs,
  }: let
    pkgs = nixpkgs.legacyPackages.x86_64-linux;
    qtEnv = pkgs.qt6.env "qt6-simc-${pkgs.qt6.qtbase.version}" [
      pkgs.qt6.qtbase
      pkgs.qt6.qtdeclarative
    ];
  in {
    devShells.x86_64-linux.default = pkgs.mkShell {
      buildInputs = with pkgs; [
        qtEnv
        qt6.qtbase
        cmake
        gcc
        qt6.wrapQtAppsHook
        makeWrapper
        bashInteractive
        clang
        jq
      ];
      shellHook = ''
        export QT_PLUGIN_PATH="${qtEnv}/lib/qt-6/plugins"
        export QML_IMPORT_PATH="${qtEnv}/lib/qt-6/qml"
        export QT_QPA_PLATFORM_PLUGIN_PATH="${qtEnv}/lib/qt-6/plugins/platforms"
        export PKG_CONFIG_PATH="${qtEnv}/lib/pkgconfig:$PKG_CONFIG_PATH"
        export QT_QPA_PLATFORM=wayland

        bashdir=$(mktemp -d)
        makeWrapper "$(type -p bash)" "$bashdir/bash" "''${qtWrapperArgs[@]}"
        exec "$bashdir/bash"
      '';
    };
  };
}
