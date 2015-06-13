# Electron.jl

Provides easy access to [atom/electron](//github.com/atom/electron) from Julia

## Installation

```julia
Pkg.add("Electron")
```

## API

```julia
import Electron
stdin,stdout,process = Electron.run("path/to/your/app")
```

The app you pass to `run` must be a normal electron app written in JavaScript. Though you can drive it from Julia via the Process's stdio streams.

## Todo

- [ ] Provide a `rebrand` function
