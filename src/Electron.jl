module Electron
const dir = dirname(dirname(@__FILE__))
const path = realpath(joinpath(dir, readall(joinpath(dir, "path"))))
run(app) = readandwrite(`$path $app`)
end
