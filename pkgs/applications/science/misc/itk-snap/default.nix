
# {stdenv, fetchurl, cmake, makeWrapper, itk, qt5 }:
{ stdenv, fetchurl, cmake, itk, qt5 }:

stdenv.mkDerivation rec {
  ver = "3.6.0";
  name = "itksnap";

  src = fetchurl {
    url = "mirror://sourceforge/itk-snap/${ver}/${name}-source-${ver}.tar.gz";
    sha256 = "a21bd0fc31bf8468f347cca636cd4c44a601fc731a91d1c8aef8f7bc389194d1";
  };

  # nativeBuildInputs = [ cmake makeWrapper ];
  # buildInputs = [ qt5 itk ];

  nativeBuildInputs = [ cmake ];
  buildInputs = [ itk qt5.full ];


  meta = {
    description = "Medical Image Segmentation tool";
    homepage = http://itksnap.org;
    platforms = stdenv.lib.platforms.unix;
  };
}
