
{stdenv, fetchurl, makeWrapper }:

stdenv.mkDerivation rec {
  name = "itksnap-3.6.0";

  src = fetchurl {
    url = "mirror://sourceforge/itk-snap/${name}-20170401-Linux-x86_64.tar.gz";
    sha256 = "ff7cd3f959617e6f13441b7f7ba1677a92eeb155ff17ed8bad06f364f8badda2";
  };

  buildInputs = [ makeWrapper ];

  postInstall = ''
    wrapProgram $out/bin/itksnap \
      --prefix LD_LIBRARY_PATH : ${out}/lib/snap-3.6.0/
  '';

  meta = {
    description = "Medical Image Segmentation tool";
    homepage = http://itksnap.org;
    platforms = stdenv.lib.platforms.unix;
  };
}
