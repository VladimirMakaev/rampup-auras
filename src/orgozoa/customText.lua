function()
    
    soundfile="Interface\\AddOns\\WeakAuras\\Media\\Sounds\\BananaPeelSlip.ogg"
    channel="Master"
    
    cooldowns = {
        {time = 30, text = "Trink+Full Ramp.Essense + Eva + Shadowfiend", sound = soundfile},
        {time = 60, text = "Rapture + Small Ramp", sound = soundfile},
        {time = 100, text = "Ramp 1", sound = soundfile},
        {time = 140, text = "Trink+Full Ramp. Essense + Eva", sound = soundfile},
        {time = 185, text = "Ramp 2", sound = soundfile}
    }
    
    tval=ceil(GetTime() - aura_env.timer)
    
    for i=1, table.getn(cooldowns) do
        if cooldowns[i].time == tval
        then
            if not aura_env.soundPlayed
            then
                
                PlaySoundFile(cooldowns[i].sound, channel)
                aura_env.soundPlayed=true
            end
            
            return cooldowns[i].text
        end        
    end    
end



