time = 0;

function GetTime()
    return time
end

local function isempty(s)
    return s == nil or s == ''
end

function PlaySoundFile()
    print(GetTime() .. "  Play Sound!")
end

ceil = math.ceil;
aura_env = {}

f = loadfile "./src/court/customText.lua"
f();

aura_env.timer = 0;

for i=1, 600 do
    time = i
    local text = onEachFrame();
    if not isempty(text) then
        print(GetTime() .. " " .. text)
    end
end