const dir = dirname(@__FILE__)
const path = realpath(joinpath(dir, readall(joinpath(dir, "path"))))
run(app) = readandwrite(`$path $app`)
