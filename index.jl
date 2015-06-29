const path = joinpath(dirname(@__FILE__), "deps/dist", {
  :Darwin => "Electron.app/Contents/MacOS/Electron",
  :Windows => "electron.exe",
  :Linux => "electron"
}[OS_NAME]) |> realpath
