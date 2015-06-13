version = v"0.28.1"
filename = "electron-v$version-$(lowercase(string(OS_NAME)))-x$WORD_SIZE.zip"
url = "https://github.com/atom/electron/releases/download/v$version/$filename"
ispath(filename) || download(url, filename)

ispath("dist") || run(`unzip $filename -d dist`)

isfile("../electron") || open("../path", "w") do io
  write(io, joinpath("./deps/dist", {
    :Darwin => "Electron.app/Contents/MacOS/Electron",
    :Windows => "electron.exe",
    :Linux => "electron"
  }[OS_NAME]))
end
