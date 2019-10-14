function onEachFrame()
    soundfile="Interface\\AddOns\\WeakAuras\\Media\\Sounds\\BananaPeelSlip.ogg"
    channel="Master"
    
    cooldowns = {
        {time = 25, text = "Full Ramp + Eva + Fiend", sound = soundfile},
        {time = 122, text = "18 Ramp + Eva", sound = soundfile},
        {time = 185, text = "18 Ramp", sound = soundfile},
        {time = 225, text = "Full Ramp + Eva + Fiend", sound = soundfile},
        {time = 312, text = "Full Ramp + Eva", sound = soundfile},
        {time = 400, text = "Full Ramp + Eva + Fiend", sound = soundfile}
    }

    tval=ceil(GetTime() - aura_env.timer)
    
    for i=1, #cooldowns do
        if cooldowns[i].time == tval
        then
            if not aura_env.soundPlayed
            then
                PlaySoundFile(cooldowns[i].sound, channel)
                aura_env.soundPlayed=true
            end
            return cooldowns[i].text
        end 
        aura_env.soundPlayed = false       
    end    
end