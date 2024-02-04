{ lib, stdenv, autoPatchelfHook, pkgs,
}:
stdenv.mkDerivation rec {
  version = "4.1.424";
  pname = "AMD uProf";

  src = builtins.fetchTarball {
    url = "https://download.amd.com/developer/eula/uprof/AMDuProf_Linux_x64_${version}.tar.bz2";
    sha256 = "sha256:1ipbhwn83isx5yzfzdin3s5y90kfniwhx33aagrhxd3p1l96vl5q";
  };

  buildInputs = with pkgs; [
    stdenv.cc.cc.lib
    zlib
    libGL
    glib
    fontconfig
    freetype
    numactl
    ncurses5
    xorg.libXi
    xorg.libSM
    xorg.libICE
    dbus
  ];

  autoPatchelfIgnoreMissingDeps = [
    "librocprofiler64.so.1"
    "libroctracer64.so.1"
    "libhsa-runtime64.so.1"
    "libpython3.6m.so.1.0"
  ];

  nativeBuildInputs = [
    autoPatchelfHook
  ];

  outputs = [ "out" ];

  installPhase = ''
    mkdir -p "$out/bin"
    cp -dr --no-preserve='ownership' bin/* $out/bin
    ls $out/bin
  '';

  meta = with lib; {
    homepage = "https://www.amd.com/en/developer/uprof.html";
    description = "AMD uProf is a performance analysis tool for AMD systems";
    license = licenses.unfree;
    platforms = [ "x86_64-linux" ];
  };
}
