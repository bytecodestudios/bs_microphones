if GetResourceState('cfx-gabz-townhall') ~= 'missing' then
    -- Gabz Townhall
    local locations = {
        {
            name = "courtroom_judge",
            prop = false,
            coords = vector3(-577.085, -210.426, 38.266),
            size = vec3(2.0, 2.0, 3.0),
            rotation = 299.993,
            range = 18.0,
        },
        {
            name = "courtroom_judge_left",
            prop = false,
            coords = vector3(-578.149, -208.604, 38.083),
            size = vec3(2.0, 2.0, 3.0),
            rotation = 304.993,
            range = 18.0,
        },
        {
            name = "courtroom_judge_right",
            prop = false,
            coords = vector3(-576.094, -212.372, 38.083),
            size = vec3(2.0, 2.0, 3.0),
            rotation = 299.993,
            range = 18.0,
        },
        {
            name = "courtroom_speaker",
            prop = false,
            coords = vector3(-572.4733, -207.7580, 38.2270),
            size = vec3(2.0, 2.0, 3.0),
            rotation = 120.7877,
            range = 18.0,
        },
        {
            name = "courtroom_lawyer1",
            prop = false,
            coords = vector3(-571.3564, -204.6052, 38.3764),
            size = vec3(2.0, 2.0, 3.0),
            rotation = 110.5563,
            range = 18.0,
        },
        {
            name = "courtroom_lawyer2",
            prop = false,
            coords = vector3(-569.1753, -208.2521, 38.2271),
            size = vec3(2.0, 2.0, 3.0),
            rotation = 115.9059,
            range = 18.0,
        }
    }
    for _, loc in ipairs(locations) do
        table.insert(Config.Microphones, loc)
    end
end