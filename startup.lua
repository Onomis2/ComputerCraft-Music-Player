shell.run("clear")
term.setTextColour(colours.green)
term.write("OnomisOs 1.3")
term.setTextColour(colours.white)
print("")
while true do
    local availableSongs = {}
    local availableSongs = fs.find("*.dfpwm")
    print("Select a song to play.\nAvailable songs:")
    for _,song in pairs(availableSongs) do
        song = song:gsub(".dfpwm", "")
        print(song)
    end
    SelectedSong = io.read()..".dfpwm"
    Dfpwm = require("cc.audio.dfpwm")
    dofile"playMusic.lua"(SelectedSong,Dfpwm)
end