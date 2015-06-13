path: src/Electron.jl
	@cd deps && julia build.jl

install:
	@julia -e 'symlink(pwd(), Pkg.dir("Electron"))'

test: path
	@julia -e 'import Electron;Electron.run("test-app")'

clean:
	rm -r deps/dist deps/*.zip path

.PHONY: test install clean
