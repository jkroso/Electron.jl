const base_path = joinpath(@__DIR__, "deps")
const app_path = joinpath(@__DIR__, "app")

"""
Ensure Electron@version is installed and return the path to its executable
"""
install(version::VersionNumber, base=base_path) = begin
  isdir(base) || mkdir(base)
  filename = "electron-v$version-$(lowercase(string(Sys.KERNEL)))-x$(Sys.WORD_SIZE).zip"
  url = "https://github.com/atom/electron/releases/download/v$version/$filename"
  filepath = joinpath(base, filename)
  dirpath = filepath[1:end-4]
  ispath(filepath) || download(url, filepath)

  # Using external program because Julia's unzip package doesn't provide enough
  # metadata about each file to extract them correctly
  isdir(dirpath) || run(`unzip -ou $filepath -d $dirpath`)

  joinpath(dirpath, (
    Darwin = "Electron.app/Contents/MacOS/Electron",
    Windows = "electron.exe",
    Linux = "electron"
  )[Sys.KERNEL]) |> realpath
end

latest() = begin
  header = read(`curl -s --head https://github.com/electron/electron/releases/latest`, String)
  VersionNumber(match(r"tag/v(\d+\.\d+\.\d+(?:-[^\r]+)?)", header)[1])
end

struct App
  title::String
  proc::Base.Process
end

App(title; version=latest()) = App(title, open(`$(install(version)) $app_path`, "w"))

Base.wait(a::App) = wait(a.proc)
