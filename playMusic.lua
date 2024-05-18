return function(SelectedSong, Dfpwm)
    local speaker = peripheral.find("speaker")

    local decoder = Dfpwm.make_decoder()

    print("Loading file...")
    local output = {}

    -- Read the file in chunks and decode
    for input in io.lines(SelectedSong, 16 * 1024) do
        local decoded = decoder(input)
        for i = 1, #decoded do
            table.insert(output, decoded[i])
        end
        sleep(0) -- Yield to avoid overloading the system
    end

    print("Playing song!")

    local function playChunks()
        local CHUNK_SIZE = 2412
        local totalSamples = #output
    
        for i = 1, totalSamples, CHUNK_SIZE do
            local chunk = {}
            for j = 1, CHUNK_SIZE do
                if output[i + j - 1] then
                    chunk[j] = output[i + j - 1]
                else
                    break
                end
            end
            local playTime = speaker.playAudio(chunk,3)
                sleep(0)
        end
    end

    playChunks()
    print("Playback finished!")
end