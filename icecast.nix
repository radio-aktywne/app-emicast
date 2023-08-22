# See: https://github.com/NixOS/nixpkgs/blob/d680ded26da5cf104dd2735a51e88d2d8f487b4d/pkgs/servers/icecast/default.nix
{
  stdenv,
  fetchurl,
  pkg-config,
  libxml2,
  libxslt,
  curl,
  libvorbis,
  libtheora,
  speex,
  libkate,
  libopus,
}:
stdenv.mkDerivation rec {
  pname = "icecast";
  version = "2.5-beta3";

  src = fetchurl {
    url = "http://downloads.xiph.org/releases/icecast/icecast-${version}.tar.gz";
    sha256 = "sha256-4FDokoA9zBDYj8RAO/kuTHaZ6jZYBLSJZiX/IYFaCW8=";
  };

  buildInputs = [
    pkg-config
    libxml2
    libxslt
    curl
    libvorbis
    libtheora
    speex
    libkate
    libopus
  ];

  hardeningEnable = ["pie"];
}
