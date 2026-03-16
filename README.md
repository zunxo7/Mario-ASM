# Mario-ASM

A **Super Mario Bros.**–style platformer written in **x86 assembly (MASM)** for Windows. Built with Visual Studio (MASM) and the Windows API.

---

## Requirements

- **Windows** (Win32)
- **Visual Studio** with C++ desktop workload and **MASM** (Microsoft Macro Assembler)
- Build for **Win32** (x86) only

---

## Build & Run

1. Open `MarioDemo.sln` in Visual Studio.
2. Set configuration to **Debug**, platform **x86** (Win32).
3. Click **Local Windows Debugger** (or press F5).

---

## Controls

| Action        | Keys                          |
|---------------|--------------------------------|
| Move left     | **Left arrow** or **A**        |
| Move right    | **Right arrow** or **D**       |
| Jump          | **Up arrow** or **W** or **Space** |
| Crouch / slide| **Down arrow** or **S**        |
| Run           | **Shift** (hold)               |
| Fireball      | **Z** (when Fire Mario)       |
| Kick (shell)  | **K** (when turtle is in shell mode — kicks shell) |
| Midas Touch   | **M** — press **5 times** to activate (when available) |
| Pause         | **Escape**                     |
| Level select  | **T** (Test mode only, from main menu) |
| Back from level select | **Escape**            |

---

## Features

### Mario

- **Forms**: Small, Super (big), Fire (shoot fireballs), plus support for Raccoon and Gold (Midas) visuals.
- **Movement**: Run, jump, crouch, gravity; **WASD** and **arrow keys**.
- **Fireballs**: As Fire Mario, press **Z** to shoot; fireballs damage enemies.
- **Invincibility**: Brief invincibility after hit (Super → Small) or after power-up.

### Power-ups & blocks

- **? blocks / Lucky blocks**: Coin, multi-coin, **Mushroom** (Super), **Fire Flower**, **Star** (invincibility), **Gold Mushroom** (Midas), **1-Up**; hidden and invisible variants.
- **Bricks**: Breakable as Super; some themed (e.g. fire blocks in castle).
- **Coins**: Collect for score and 1-Ups at 100.

### Enemies

- **Goombas**, **Koopa Troopas** (walk, shell; press **K** when turtle is in shell mode to kick the shell), **Flying turtles**, **Piranha plants**, **Bowser** (boss).
- **Bowser**: Fireballs, lava death; defeat by fireballs, star, or **Midas Touch**; **not kickable**.
- **Firebars**: Rotating hazards (level data).
- **Stomping** and **shell kicks** damage enemies; star and Midas one-shot.

### Level & world

- **4 levels** (level data in `levels\`: `level1.txt`–`level4.txt`, pipes, platforms, firebars, `level_setup.txt` for camera/background).
- **Level editor**: `level_editor.html` — optional in-browser tool to edit level tile data.
- **Overworld / underground / castle** themes; camera and background per level (e.g. `level_setup.txt`: overworld/underground snap Y, background height/offset).
- **Pipes**: Enter/exit; pipe travel (warp) with sound.
- **Flagpole**: Reach to finish level; castle flag for Bowser level.
- **Lava / death tiles**: Instant death or Bowser lava sequence.
- **Platforms**: Moving platforms (from level data).

### Midas Touch

- Press **M** **5 times** to activate when available; turns enemies to gold (defeats them).
- **Single use per game** (one use total); **disabled on Level 4** (Bowser).

### Save & continue

- **Save**: Progress (level, position, power-up state) saved to `saves.txt` and `data\`.
- **Continue**: From main menu, restores level and state when available.

### Audio

- **Music**: Menu, level 1–4, underground, castle, victory, world clear.
- **SFX**: Jump, coin, stomp, fireball, power-up, pipe, flagpole, bump, block break, shell kick, 1-Up, Bowser fire/fall, time warning, pause, game over, fireworks.

### Test mode

- **Username `TEST`**:
  - From **main menu**, press **T** to open **level select** overlay.
  - Level select is an overlay on the menu (logo and menu text hidden); **Escape** closes it.
  - Direct level pick for testing.

### Win / lose

- **Game Over**: No lives left; name entry and main menu.
- **Game Complete**: Shown when Bowser is defeated (fireball, star, Midas, or lava death); then high scores / end flow.

---

## Project layout

```
MarioDemo/
├── mario.asm              # Main game (logic, draw, input, levels)
├── MarioDemo.sln
├── MarioDemo.vcxproj
├── MarioDemo.vcxproj.filters
├── level_editor.html      # Optional level editor
├── asset/                 # Sprites & backgrounds (.bmp)
├── sounds/                # Music & SFX (.wav)
├── levels/                # Level tiles, pipes, platforms, firebars, level_setup.txt
└── data/                  # Runtime save data (gitignored)
```

---

## Level data

- **levelN.txt**: Tile grid (tile IDs for ground, bricks, pipes, spawns, etc.).
- **level_setup.txt**: Per-level camera snap Y (overworld/underground), background height/offset.
- **levelN_pipes.txt**, **levelNplatforms.txt**, **levelNfirebars.txt**: Pipes, platforms, firebars.

---

## Credits

- **Zunnoon Jawad**
- Window title: SUPER MARIO BROS - I24 - 0531
