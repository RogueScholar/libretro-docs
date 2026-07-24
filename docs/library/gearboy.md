# Nintendo - Game Boy / Color (Gearboy)

## Background

Gearboy is an open source, cross-platform Nintendo Game Boy (DMG), Game Boy Color (GBC), and Super Game Boy (SGB) emulator written in C++.

- Accurate emulation with support for ROM-only cartridges and MBC1, MBC1M, MBC2, MBC3, MBC5, MBC7, HuC-1, HuC-3, MMM01, Pocket Camera, TAMA5, Wisdom Tree, M161, Sachen MMC1/MMC2, PKJD, Bung/EMS, and Poke 2-in-1 mappers.
- Game Boy Color support.
- Super Game Boy support, including borders and color palettes.
- Battery-backed RAM save support.
- Save states.
- Boot ROM (BIOS) support.
- Game Genie and GameShark cheat support.
- Supported platforms (libretro): Windows, Linux, macOS, Raspberry Pi, Android, iOS, tvOS, PlayStation Vita, PlayStation 3, Nintendo 3DS, Nintendo GameCube, Nintendo Wii, Nintendo WiiU, Nintendo Switch, Emscripten, Classic Mini systems (NES, SNES, C64, ...), OpenDingux, RetroFW and QNX.

The Gearboy core has been authored by:

- [Nacho Sanchez (drhelius)](https://github.com/drhelius)

The Gearboy core is licensed under:

- [GPLv3](https://github.com/drhelius/Gearboy/blob/master/LICENSE)

A summary of the licenses behind RetroArch and its cores can be found [here](../development/licenses.md).

## BIOS

Gearboy does not require boot ROM (BIOS) files, but they can be used optionally.

When enabled, a boot ROM runs as it does on original hardware. Invalid ROMs may fail to boot, and the selected boot ROM may enable hardware differences for systems such as Game Boy Pocket or Game Boy Advance.

Required or optional firmware files go in the frontend's system directory.

!!! attention
	Place boot ROM files in RetroArch's system directory, then enable the [DMG Bootrom](#core-options) or [GBC Bootrom](#core-options) core option.

| Filename     | Description                        | md5sum                           |
|:------------:|:----------------------------------:|:--------------------------------:|
| dmg_boot.bin | Game Boy boot ROM - Optional       | 32fbbd84168d3482956eb3c5051637f5 |
| cgb_boot.bin | Game Boy Color boot ROM - Optional | dbfce9db9deaa2567f6a84fde55f9680 |

## Extensions

Content that can be loaded by the Gearboy core have the following file extensions:

- .gb
- .dmg
- .gbc
- .cgb
- .sgb

RetroArch database(s) that are associated with the Gearboy core:

- [Nintendo - Game Boy](https://github.com/libretro/libretro-database/blob/master/rdb/Nintendo%20-%20Game%20Boy.rdb)
- [Nintendo - Game Boy Color](https://github.com/libretro/libretro-database/blob/master/rdb/Nintendo%20-%20Game%20Boy%20Color.rdb)

## Features

Frontend-level settings or features that the Gearboy core respects.

| Feature           | Supported |
|-------------------|:---------:|
| Restart           | ✔         |
| Screenshots       | ✔         |
| Saves             | ✔         |
| States            | ✔         |
| Rewind            | ✔         |
| Netplay           | ✔         |
| Core Options      | ✔         |
| [Memory Monitoring (achievements)](../guides/memorymonitoring.md) | ✔         |
| RetroArch Cheats - Game Genie | ✔         |
| RetroArch Cheats - GameShark | ✔         |
| Native Cheats     | ✕         |
| Controls          | ✔         |
| Remapping         | ✔         |
| Multi-Mouse       | ✕         |
| Rumble            | ✕         |
| Sensors           | ✔         |
| Camera            | ✕         |
| Location          | ✕         |
| Subsystem         | ✕         |
| [Softpatching](../guides/softpatching.md) | ✔         |
| Disk Control      | ✕         |
| Username          | ✕         |
| Language          | ✕         |
| Crop Overscan     | ✕         |
| LEDs              | ✕         |

### Directories

The Gearboy core's library name is 'Gearboy'

The Gearboy core saves/loads to/from these directories.

**Frontend's Save directory**

| File  | Description            |
|:-----:|:----------------------:|
| *.srm | Cartridge battery save |
| *.rtc | Real time clock save   |

**Frontend's State directory**

| File     | Description |
|:--------:|:-----------:|
| *.state# | State       |

### Geometry and timing

- The Gearboy core's provided FPS is 59.7275005696
- The Gearboy core's provided sample rate is 44100 Hz
- The Gearboy core's base size is 160x144, or 256x224 when an SGB border is displayed
- The Gearboy core's max width is 256
- The Gearboy core's max height is 224
- The Gearboy core's provided aspect ratio is 10:9 without an SGB border and 8:7 with a border

## Core options

The Gearboy core has the following options that can be tweaked from the core options menu. The default setting is bolded.

Settings with (restart) means that core has to be closed for the new setting to be applied on next launch.

- **Game Boy Model (restart)** [gearboy_model] (**Auto**|Game Boy DMG|Game Boy Advance)

	Select which hardware/model is emulated.

	- *Auto* selects the best hardware based on the ROM header.
    - *Game Boy DMG* forces original Game Boy hardware.
    - *Game Boy Advance* enables Game Boy Advance hardware.

- **Mapper (restart)** [gearboy_mapper] (**Auto**|ROM Only|MBC 1|MBC 2|MBC 3|MBC 5|MBC 1 Multicart|HuC 1|HuC 3|MMM01|Camera|MBC 7|TAMA5|Wisdom Tree|M161|Sachen MMC1|Sachen MMC2|PKJD|Bung/EMS|Poke 2-in-1)

	Select which Memory Bank Controller (MBC or mapper) is emulated.

	- *Auto* selects the best mapper based on the ROM header.
    - *ROM Only* forces no MBC.
    - *MBC 1* forces MBC 1.
    - *MBC 2* forces MBC 2.
    - *MBC 3* forces MBC 3.
    - *MBC 5* forces MBC 5.
    - *MBC 1 Multicart* forces MBC 1 Multicart.
    - *HuC 1* forces HuC 1.
    - *HuC 3* forces HuC 3.
    - *MMM01* forces MMM01.
    - *Camera* forces Pocket Camera.
    - *MBC 7* forces MBC 7.
    - *TAMA5* forces TAMA5.
	- *Wisdom Tree* forces the Wisdom Tree mapper.
	- *M161* forces the M161 mapper.
	- *Sachen MMC1* forces the Sachen MMC1 mapper.
	- *Sachen MMC2* forces the Sachen MMC2 mapper.
	- *PKJD* forces the PKJD mapper.
	- *Bung/EMS* forces the Bung/EMS flash cartridge mapper.
	- *Poke 2-in-1* forces the Poke 2-in-1 mapper.

- **Super Game Boy (restart)** [gearboy_sgb] (**Enabled**|Disabled)

	Run compatible games in Super Game Boy mode. Disable this option to run them as standard Game Boy games.

- **Super Game Boy Border** [gearboy_sgb_border] (**Enabled**|Disabled)

	Display the Super Game Boy border around the game screen. Disable this option to show only the 160x144 game screen.

- **DMG Palette** [gearboy_palette] (**Original**|Sharp|B/W|Autumn|Soft|Slime)

	Select a color palette for Game Boy DMG games.

- **GBC Color Correction** [gearboy_color_correction] (**Disabled**|Enabled)

	Enables color correction for Game Boy Color games to simulate the original GBC LCD screen output.

- **DMG Bootrom (restart)** [gearboy_bootrom_dmg] (**Disabled**|Enabled)

	Enable or disable the original Game Boy bootrom. For this to work, the `dmg_boot.bin` file must exist in RetroArch's system directory.

- **GBC Bootrom (restart)** [gearboy_bootrom_gbc] (**Disabled**|Enabled)

	Enable or disable the Game Boy Color bootrom. For this to work, the `cgb_boot.bin` file must exist in RetroArch's system directory.

- **Allow Up+Down / Left+Right** [gearboy_up_down_allowed] (**Disabled**|Enabled)

	Allow pressing, quickly alternating, or holding both left and right, or up and down, at the same time. This may cause movement-based glitches in some games.

- **Tilt Source (MBC7)** [gearboy_tilt_source] (**Mouse**|Sensor|Analog Stick)

	Select the input source for MBC7 tilt controls.

- **Sensor Sensitivity X (MBC7)** [gearboy_sensor_sensitivity_x] (**5**|1-10)

	Set the horizontal sensitivity when using sensor input for MBC7 tilt controls.

- **Sensor Sensitivity Y (MBC7)** [gearboy_sensor_sensitivity_y] (**5**|1-10)

	Set the vertical sensitivity when using sensor input for MBC7 tilt controls.

- **Sensor Invert X (MBC7)** [gearboy_sensor_invert_x] (**Disabled**|Enabled)

	Invert the horizontal axis when using sensor input for MBC7 tilt controls.

- **Sensor Invert Y (MBC7)** [gearboy_sensor_invert_y] (**Disabled**|Enabled)

	Invert the vertical axis when using sensor input for MBC7 tilt controls.

- **Mouse Sensitivity X (MBC7)** [gearboy_mouse_sensitivity_x] (**5**|1-10)

	Set the horizontal sensitivity when using mouse input for MBC7 tilt controls.

- **Mouse Sensitivity Y (MBC7)** [gearboy_mouse_sensitivity_y] (**5**|1-10)

	Set the vertical sensitivity when using mouse input for MBC7 tilt controls.

- **Mouse Invert X (MBC7)** [gearboy_mouse_invert_x] (**Disabled**|Enabled)

	Invert the horizontal axis when using mouse input for MBC7 tilt controls.

- **Mouse Invert Y (MBC7)** [gearboy_mouse_invert_y] (**Disabled**|Enabled)

	Invert the vertical axis when using mouse input for MBC7 tilt controls.

- **Analog Sensitivity X (MBC7)** [gearboy_analog_sensitivity_x] (**5**|1-10)

	Set the horizontal sensitivity when using analog stick input for MBC7 tilt controls.

- **Analog Sensitivity Y (MBC7)** [gearboy_analog_sensitivity_y] (**5**|1-10)

	Set the vertical sensitivity when using analog stick input for MBC7 tilt controls.

- **Analog Invert X (MBC7)** [gearboy_analog_invert_x] (**Disabled**|Enabled)

	Invert the horizontal axis when using analog stick input for MBC7 tilt controls.

- **Analog Invert Y (MBC7)** [gearboy_analog_invert_y] (**Disabled**|Enabled)

	Invert the vertical axis when using analog stick input for MBC7 tilt controls.

## Joypad

![](../image/controller/gb.png)

| User 1 input descriptors | RetroPad Inputs                             |
|--------------------------|---------------------------------------------|
| B                        | ![](../image/retropad/retro_b.png)          |
| Select                   | ![](../image/retropad/retro_select.png)     |
| Start                    | ![](../image/retropad/retro_start.png)      |
| Up                       | ![](../image/retropad/retro_dpad_up.png)    |
| Down                     | ![](../image/retropad/retro_dpad_down.png)  |
| Left                     | ![](../image/retropad/retro_dpad_left.png)  |
| Right                    | ![](../image/retropad/retro_dpad_right.png) |
| A                        | ![](../image/retropad/retro_a.png)          |

## Compatibility

- [Gearboy Accuracy Tests](https://github.com/drhelius/Gearboy#accuracy-tests)

## External Links

- [Official Gearboy Github Repository](https://github.com/drhelius/Gearboy)
- [Libretro Gearboy Core info file](https://github.com/libretro/libretro-super/blob/master/dist/info/gearboy_libretro.info)
- [Report Libretro Gearboy Core Issues Here](https://github.com/drhelius/Gearboy/issues)

### See also

#### Nintendo - Game Boy (+ Color)

- [Nintendo - Game Boy / Color (Emux GB)](emux_gb.md)
- [Nintendo - Game Boy / Color (Gambatte)](gambatte.md)
- [Nintendo - Game Boy / Color (SameBoy)](sameboy.md)
- [Nintendo - Game Boy / Color (TGB Dual)](tgb_dual.md)
- [Nintendo - Game Boy Advance (mGBA)](mgba.md)
- [Nintendo - Game Boy Advance (VBA-M)](vba_m.md)
- [Nintendo - SNES / Famicom (higan Accuracy)](higan_accuracy.md)
- [Nintendo - SNES / Famicom (nSide Balanced)](nside_balanced.md)
- [Nintendo - SNES / Famicom (Mesen-S)](mesen-s.md)
