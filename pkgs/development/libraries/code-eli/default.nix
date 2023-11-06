{ lib
, stdenv
, cmake
, fetchFromGitHub
}:

stdenv.mkDerivation rec {
  pname = "code-eli";
  version = "0.3.6";

  src = fetchFromGitHub {
    owner = "ddmarshall";
    repo = "Code-Eli";
    rev = "${version}";
    hash = "sha256-yBQeGcOEtNpvCteySnZzWgK32A++0GE2m6oyEPGRTXg=";
  };

  strictDeps = true;

  nativeBuildInputs = [
    cmake
  ];

  cmakeFlags = [ ];

  meta = {
    description = "Curve & surface library";
    homepage = "";
    license = lib.licenses.epl10;
    platforms = lib.platforms.all;
    maintainers = [ ];
  };
}
