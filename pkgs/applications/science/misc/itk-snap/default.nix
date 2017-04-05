
{stdenv, fetchurl, makeWrapper }:

stdenv.mkDerivation rec {
  name = "itksnap-3.6.0";

  src = fetchurl {
    url = "mirror://sourceforge/itk-snap/${name}-20170401-Linux-x86_64.tar.gz";
  };

  buildInputs = [ makeWrapper ];


  meta = {
    description = "Medical Image Segmentation tool";
    homepage = http://itksnap.org;
    platforms = stdenv.lib.platforms.unix;
  };
}
