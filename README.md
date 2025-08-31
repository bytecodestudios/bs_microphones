# 🎤 Bytecode Studios Microphones Script  

A FiveM script that allows players to activate or deactivate microphones in specific zones. When inside a microphone zone, players can boost their voice range to speak to a larger audience. Perfect for **courtrooms, stages, events, or town halls**.  

---

## 📦 Features
- 🎚️ Toggle microphone on/off with a keybind (default: **E**)  
- 📢 Dynamic **voice range override** using [pma-voice](https://github.com/AvarianKnight/pma-voice)  
- 🎭 Automatic **object spawning** for microphone props (optional)  
- 🗺️ **Zone-based system** using [ox_lib](https://github.com/communityox/ox_lib)  
- 🏛️ Preconfigured **Gabz Townhall courtroom microphones** (if resource is installed)  
- 🛠️ Easy to add custom microphones via `Config.Microphones`  

---

## ⚙️ Dependencies
- [ox_lib](https://github.com/communityox/ox_lib)  
- [pma-voice](https://github.com/AvarianKnight/pma-voice)  
- (Optional) [cfx-gabz-townhall](https://fivem.gabzv.com/package/5127312)  

---

## 📥 Installation
1. Download the script and place it in your server’s `resources` folder.  
2. Add the resource to your **server.cfg**:  
   ```cfg
   ensure bs_microphones
   ```
3. Make sure ox_lib and pma-voice are running before this script.

## 🔧 Configuration

All microphone zones are defined in config.lua.

Example:

```lua
Config.Microphones = {
    {
        name = "test_microphone", -- identifier
        prop = `v_ilev_fos_mic`, -- microphone prop (or false for none)
        coords = vector3(-539.3686, -213.5119, 37.6497), -- location
        size = vec3(2.0, 2.0, 3.0), -- zone size
        rotation = 35.0697, -- zone/prop heading
        range = 18.0, -- voice range while using mic
    }
}
```


`prop`: Model hash of a microphone object (set to false if no object needed).

`coords`: Placement of the microphone.

`size`: Size of the ox_lib zone.

`rotation`: Orientation of the zone and prop.

`range`: How far your voice will carry when using the mic.

### Note : If Gabz Townhall is installed, microphones will automatically spawn inside the courtroom.

## 🎮 Usage

1. Walk into a configured microphone zone.

2. A text prompt will appear:

```rust
Use E for microphone
```

4. Press E (or your bound key) to activate the microphone.

 - ✅ You will receive a notification: Microphone Activated

 - ❌ Press again to deactivate: Microphone De-Activated

Your proximity range is only boosted inside the zone. Leaving the zone will automatically reset your voice range.