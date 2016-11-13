# Electron.jl

Provides easy access to [atom/electron](//github.com/atom/electron) from Julia

## Installation

```julia
@require "github.com/jkroso/Electron.jl" => Electron
```

See [Rutherford.jl](//github.com/jkroso/Rutherford.jl) for example usage

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

### App

Boots up an Electron app which can have messages written to its `stdin` in order to open windows

```
const app = App("Electron")
```
