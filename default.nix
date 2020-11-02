{ stdenv
, fetchurl
, llvmPackages
, overrideCC
, gcc }:

let

openmp = llvmPackages.openmp;

in (overrideCC stdenv gcc).mkDerivation rec {
  pname = "PhysiCell";
  version = "1.7.1";

  buildInputs = [ openmp ];
  nativeBuildInputs = [ openmp ];

  src = fetchGit {
    url = "file:///Users/dom/PhysiCell";
    rev = "0f4c85b55b71c553e91721d1a0e37414008a2ef5";
  };

  PHYSICELL_CPP="${gcc}/bin/g++";

  project = "GBM_stroma_growth";

  buildPhase = ''
    make $project-sample
    make
  '';

  installPhase = ''
    mkdir -p "$out"/bin
    cp $project $out/bin/$project
  '';

  meta = with stdenv.lib; {
    description = "PhysiCell: an Open Source Physics-Based Cell Simulator for 3-D Multicellular Systems.";
    homepage    = http://physicell.org;
    platforms   = platforms.all;
    maintainers = with maintainers; [ idontgetoutmuch ];
    license     = licenses.bsd3;
  };
}
