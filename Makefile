install:
	@julia -e 'symlink(pwd(), Pkg.dir("Electron"))'

test:
	@julia -e 'import Electron;run(`$$(Electron.install(Electron.latest())) test-app`)'

.PHONY: test install
