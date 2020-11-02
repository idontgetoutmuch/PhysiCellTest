# PhysiCellTest

This will build a sample project in PhysiCell (currently one in my github fork) via nix.

* curl -L https://nixos.org/nix/install | sh
* git clone https://github.com/idontgetoutmuch/PhysiCellTest
* cd PhysiCellTest
* nix-build release.nix
* ./result/bin/GBM_stroma_growth GBM_stroma_growth.xml
