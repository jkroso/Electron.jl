# Electron.jl

Provides easy access to [atom/electron](//github.com/atom/electron) from Julia

## Installation

```julia
Pkg.clone("https://github.com/jkroso/Electron.jl.git")
Pkg.build("Electron")
```

## API

### latest()

Returns the `VersionNumber` of electons latest release

### install(::VersionNumber)

Installs a given version of Electron and returns the path to its executable

```julia
import Electron
electron = Electron.install(Electron.latest())
stdin,process = open(`$electron path/to/your/app`, "w")
```
