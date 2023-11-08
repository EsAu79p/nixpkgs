{
  lib,
  stdenv,
  fetchFromGitHub,
  pkg-config,
  libjack2,
  lv2,
  glib,
  qt5,
  libao,
  cairo,
  libsndfile,
  fftwFloat,
  autoreconfHook,
}:
stdenv.mkDerivation rec {
  pname = "spectmorph";
  version = "0.6.1";
  src = fetchFromGitHub {
    owner = "swesterfeld";
    repo = pname;
    rev = version;
    sha256 = "sha256-fqbVPSg7T1bVIZPhz32r1osY5df9c1VF+GEzJsyxIXo=";
  };

  buildInputs = [libjack2 lv2 glib qt5.qtbase libao cairo libsndfile fftwFloat];

  nativeBuildInputs = [pkg-config autoreconfHook];

  dontWrapQtApps = true;

  meta = with lib; {
    description = "Allows to analyze samples of musical instruments, and to combine them (morphing) to construct hybrid sounds";
    homepage = "https://spectmorph.org";
    license = licenses.gpl3;
    platforms = ["x86_64-linux" "i686-linux"];
    maintainers = [maintainers.magnetophon];
  };
}
