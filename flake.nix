{
  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.05";
  outputs = { self, nixpkgs }: let
    system = "aarch64-darwin";
    pkgs = import nixpkgs { inherit system; };
  in {
    devShells.${system}.default = pkgs.mkShell {
      packages = with pkgs; [ ffmpeg-full parallel mediainfo yt-dlp ];
      shellHook = ''
        echo "🔧 ffmpeg: $(ffmpeg -version | head -1)"
        echo "🔧 parallel: $(parallel --version | head -1)"
      '';
    };
  };
}
