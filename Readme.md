# Electron.jl

Provides easy access to [atom/electron](//github.com/atom/electron) from Julia

## Installation

```julia
Pkg.add("Electron")
```

## API

This package provides one variable, `path`. Which is the path to the Electron executable

```julia
import Electron
stdin,process = open(`$(Electron.path) path/to/your/app`, "w")
```
