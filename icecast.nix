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
}: let
  pname = "icecast";
  version = "2.5-beta3";
  sha256 = "sha256-4FDokoA9zBDYj8RAO/kuTHaZ6jZYBLSJZiX/IYFaCW8=";
in
  stdenv.mkDerivation {
    inherit pname version;

    src = fetchurl {
      inherit sha256;

      url = "http://downloads.xiph.org/releases/${pname}/${pname}-${version}.tar.gz";
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
