version = v"0.28.3"
filename = "electron-v$version-$(lowercase(string(OS_NAME)))-x$WORD_SIZE.zip"
url = "https://github.com/atom/electron/releases/download/v$version/$filename"
ispath(filename) || download(url, filename)

# Using external program because Julia's unzip package doesn't provide enough
# metadata about each file to extract them correctly
run(`unzip -ou $filename -d dist`)
