const base = joinpath(dirname(@__FILE__), "deps")

"""
Download a specific `version` Electron into `base` and return the full path
to its executable binary
"""
install(version::VersionNumber, base=base) = begin
  isdir(base) || mkdir(base)
  filename = "electron-v$version-$(lowercase(string(OS_NAME)))-x$WORD_SIZE.zip"
  url = "https://github.com/atom/electron/releases/download/v$version/$filename"
  filepath = joinpath(base, filename)
  dirpath = filepath[1:end-4]
  ispath(filepath) || download(url, filepath)

  # Using external program because Julia's unzip package doesn't provide enough
  # metadata about each file to extract them correctly
  isdir(dirpath) || run(`unzip -ou $filepath -d $dirpath`)

  joinpath(dirpath, Dict(
    :Darwin => "Electron.app/Contents/MacOS/Electron",
    :Windows => "electron.exe",
    :Linux => "electron"
  )[Sys.KERNEL]) |> realpath
end

latest() = begin
  header = readall(`curl -s --head https://github.com/electron/electron/releases/latest`)
  VersionNumber(match(r"v(\d+\.\d+\.\d+)", header)[1])
end
