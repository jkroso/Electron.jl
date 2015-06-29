deps/dist:
	@cd deps && julia build.jl

install:
	@julia -e 'symlink(pwd(), Pkg.dir("Electron"))'

test: deps/dist
	@julia -e 'import Electron;run(`$$(Electron.path) test-app`)'

clean:
	rm -r deps/dist deps/*.zip

.PHONY: test install clean
