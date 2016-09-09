test:
	@julia -e '@require "." install latest;run(`$$(install(latest())) test-app`)'

.PHONY: test
