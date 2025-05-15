MACOS_VERSION := /Applications/OpenSCAD.app/Contents/MacOS/OpenSCAD
OPENSCAD := $(shell command -v openscad 2> /dev/null || echo $(MACOS_VERSION))

rebel_alliance_stencil.stl: rebel_alliance_stencil.scad rebel_alliance_logo.svg
	$(OPENSCAD) -o $@ $<

clean: 
	rm -f rebel_alliance_stencil.stl

.PHONY: clean
