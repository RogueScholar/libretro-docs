---
title: bsnes Accuracy (Super&nbsp;NES/Famicom)
description: >-2
  A Super Nintendo/Famicom emulator for Libretro frontends, like RetroArch.
icon: cores/bsnes
status: stable
glightbox: true
---

# Libretro bsnes Accuracy core :cores-bsnes:

**bsnes** is a Super Nintendo Entertainment System/Super Famicom emulator that
has been in development simce October 2004, with a focus on accuracy and
maintaining a clean codebase. It never uses speed or compatibility hacks, and
thus the minimum system requirements are greater than with other emulators for
these consoles. bsnes comes in three different "profiles" (**Accuracy**,
[**Balanced**][bsnes-balanced] and [**Performance**][bsnes-performance]) which
represent minor differences in the tuning of the PPU (graphics) emulation.

This core has been compiled to use the **Accuracy** profile and produces highly
accurate SNES emulation.

The choice of profile to use with this core is a reflection of a user's
preference for accurate emulation vs. gameplay responsiveness, with the Accuracy
profile intended for users who are comfortable sacrificing responsiveness for
faithful emulation whenever the two are in conflict. The average user is advised
to use the Balanced profile until such time as they have a concrete reason to
prefer one extreme or the other.

## Compatibility

The bsnes Accuracy core fully emulates all officially released SNES games.

## Author / License

The bsnes Accuracy core was originally authored by

- [**byuu**][enwiki-byuu]

and is distributed according to the terms of the

- [GNU General Public License, version 3.0 (or later)][bsnes-license].

A summary of the [licenses governing the use and distribution of RetroArch and
its cores][ra-licensing] is also available.

## File extensions

Content that can be loaded by the bsnes Accuracy core have the following file
extensions:

- `.sfc`
- `.smc`
- `.bml`

## Databases

RetroArch database(s) that are associated with the bsnes Accuracy core are:

- [Nintendo - Super Nintendo Entertainment System][rdb-snes]
- [Nintendo - Super Nintendo Entertainment System Hacks][rdb-snes-hacks]
- [Nintendo - Sufami Turbo][rdb-sufami-turbo]

## BIOS

Any required or optional firmware files must be placed in the frontend's
**system** directory.

!!! attention
    The bsnes Accuracy core uses split ROMS for
    [special chip games][enwiki-snes-chips].

### Notable DSP1/DSP1B games

- Super Mario Kart
- Pilotwings

### Notable DSP2 games

- Dungeon Master

### Notable DSP3 games

- SD Gundam GX

### Notable DSP4 games

- Top Gear 3000

### Notable CX4 games

- Mega Man X2
- Mega Man X3

### Firmware files

{{ read_csv('bsnes_accuracy-firmware.csv', colalign=('left','left','center'), comment='#') }}

## Features

Front end-level settings or features that the bsnes Accuracy core respects:

{{ read_csv('bsnes_accuracy-features.csv', colalign=('right','center'), comment='#') }}

## Directories

The bsnes Accuracy core's internal core name is 'bsnes', which saves/loads
to/from these directories:

- Frontend's Save directory

:   `<content_name>.srm` (Cartridge battery save)

- Frontend's State directory

:   `<content_name>.state` (State)

## Geometry and timing

The bsnes Accuracy core provides…

- …a refresh rate of 60.0988118623 frames/second for NTSC games and
  50.0069789082 frames/second for PAL games.
- …an audio sample rate of 32040.5 Hz.
- …video output with a 4:3 aspect ratio.

## Super GameBoy

!!! warning
    Super GameBoy support in this core is **Windows only**, and has **buggy save
    state support** and **visual glitches**. Use the
    [**higan Accuracy core**][higan-accuracy-sgameboy] or the
    [**nSide Balanced core**][nside-balanced-sgameboy] for simplified,
    functional, and easily accessible Super Gameboy support.

For Super GameBoy support, you need `sgb.boot.rom` (in the frontend's **system**
directory), a GameBoy ROM and a Super GameBoy ROM.

!!! note
    Game Boy and Super GameBoy ROMs must be extracted from any archive format
    they may be stored in (such as .zip) prior to use.

Super GameBoy is supported via the Subsystem API, which offers two access
methods.

### Subsystem API

#### Graphical UI access

Access to the Subsystem API can be done through RetroArch's GUI as described
below.

1. Load your GameBoy ROM using 'Load Super GameBoy' in RetroArch's Main Menu.

    ![bsnes Main Menu][bsnes-menu1]{ data-gallery="gameboy-rom" width="360" }
    &emsp;&emsp;
    ![bsnes Load Super Gameboy menu][bsnes-load-gameboy]{ data-gallery="gameboy-rom" width="360" }

1. Likewise, load your Super GameBoy ROM using 'Load Super GameBoy'.

    ![bsnes Menu][bsnes-menu2]{ data-gallery="super-gameboy-rom" width="360" }
    &emsp;&emsp;
    ![bsnes Load Super Gameboy menu][bsnes-load-sgameboy]{ data-gallery="super-gameboy-rom" width="360" }

1. Start the content by selecting 'Start GameBoy' In RetroArch's Menu Menu.

    <figure markdown="span">
      ![bsnes Start Gameboy][bsnes-start-gameboy]{ data-gallery="start-gameboy" width="360" }
    </figure>

#### Command line access

The Subsystem API can also be accessed via the command line, using the flags
shown below.

``` shell
retroarch -L <path_to_bsnes_core> <path_to_Super_GameBoy_ROM> --subsystem sgb <path_to_GameBoy_ROM>
```

## MSU-1 support

!!! attention "MSU-1 support"
    MSU-1 support in this core is complex. **Use the [Snes9x core][snes9x-msu1]
    for more simplified and easily accessible MSU-1 support.**

MSU-1 support can be used by loading a correct `.bml` file.

Documentation is available describing the process of
[loading MSU-1 games in the standalone higan emulator][higan-msu1].

## Input devices

The bsnes Accuracy core supports the following device type(s) in the controls
menu; device types shown in boldface **CAPS** are the default for the specified
user(s):

### User 1 device types

| Device                                | Type           |
|:-------------------------------------:|:--------------:|
| None                                  | Input disabled |
| [**SNES JOYPAD**][fandom-snes-joypad] | Joypad         |
| [SNES Mouse][enwiki-snes-mouse]       | Mouse          |

### User 2 device types

Activating multitap support in compatible games can be configured by switching
to the `Multitap` device type for User 2.

{{ read_csv('bsnes_accuracy-input-user2.csv', colalign=('center','center'), comment='#') }}

### Controller input mapping tables

#### Gamepad

!!! info inline end "SNES controller (click to expand)"
    ![SNES controller legend][snes-controller]{ data-gallery="controller" width="360" }

{{ read_csv('bsnes_accuracy-input-gamepad.csv', colalign=('center','center'), comment='#') }}

#### Mouse

{{ read_csv('bsnes_accuracy-input-mouse.csv', colalign=('center','center'), comment='#') }}

#### Lightgun

{{ read_csv('bsnes_accuracy-input-lightgun.csv', colalign=('center','center','center'), comment='#') }}

## See also

### Super Nintendo Entertainment System (+&nbsp;Hacks)

- [Libretro Beetle bsnes core (Super NES/Famicom)][beetle-bsnes]
- [Libretro bsnes-mercury Accuracy core (Super NES/Famicom)][bsnes-mercury-accuracy]
- [Libretro bsnes-mercury Balanced core (Super NES/Famicom)][bsnes-mercury-balanced]
- [Libretro bsnes-mercury Performance core (Super NES/Famicom)][bsnes-mercury-performance]
- [Libretro bsnes Balanced core (Super NES/Famicom)][bsnes-balanced]
- [Libretro bsnes C++98 v085 core (Super NES/Famicom)][bsnes-c++98]
- [Libretro bsnes Performance core (Super NES/Famicom)][bsnes-performance]
- [Libretro higan Accuracy core (Super NES/Famicom)][higan-accuracy]
- [Libretro Mesen-S core (Super NES/Famicom)][mesen-s]
- [Libretro nSide Balanced core (Super NES/Famicom)][nside-balanced]
- [Libretro Snes9x core (Super NES/Famicom)][snes9x]
- [Libretro Snes9x 2002 core (Super NES/Famicom)][snes9x-2002]
- [Libretro Snes9x 2005 core (Super NES/Famicom)][snes9x-2005]
- [Libretro Snes9x 2005 Plus core (Super NES/Famicom)][snes9x-2005+]
- [Libretro Snes9x 2010 core (Super NES/Famicom)][snes9x-2010]

### Nintendo Sufami&nbsp;Turbo

- [Libretro Beetle bsnes core (Sufami Turbo)][beetle-bsnes]
- [Libretro bsnes-mercury Accuracy core (Sufami Turbo)][bsnes-mercury-accuracy]
- [Libretro bsnes-mercury Balanced core (Sufami Turbo)][bsnes-mercury-balanced]
- [Libretro bsnes-mercury Performance core (Sufami Turbo)][bsnes-mercury-performance]
- [Libretro bsnes Balanced core (Sufami Turbo)][bsnes-balanced]
- [Libretro bsnes C++98 v085 core (Sufami Turbo)][bsnes-c++98]
- [Libretro bsnes Performance core (Sufami Turbo)][bsnes-performance]
- [Libretro Snes9x core (Sufami Turbo)][snes9x]
- [Libretro Snes9x 2002 core (Sufami Turbo)][snes9x-2002]
- [Libretro Snes9x 2005 core (Sufami Turbo)][snes9x-2005]
- [Libretro Snes9x 2005 Plus core (Sufami Turbo)][snes9x-2005+]
- [Libretro Snes9x 2010 core (Sufami Turbo)][snes9x-2010]

## External links

- **higan SNES Emulator** (upstream project):
    + [Official Website][higan]
    + [Downloads Page][higan-downloads]
- **Libretro bsnes Accuracy Core:**
    + [Core info file][core-info-file]
    + [Source Code Repository][github-bsnes-libretro]
    + [Issue Tracker][github-bsnes-libretro-issues]

[beetle-bsnes]: beetle_bsnes.md
  "Beetle bsnes (Super NES/Famicom) - Libretro Documentation"
[bsnes-balanced]: bsnes_balanced.md
  "bsnes Balanced (Super NES/Famicom) - Libretro Documentation"
[bsnes-c++98]: bsnes_cplusplus98.md
  "bsnes C++98 v085 (Super NES/Famicom) - Libretro Documentation"
[bsnes-license]: https://github.com/libretro/bsnes-libretro/blob/master/LICENSE.txt
  "GitHub: bsnes-libretro/LICENSE.txt on master • libretro/bsnes-libretro"
[bsnes-load-gameboy]: ../image/core/bsnes/gb.png
  "Use the file picker menu to select the Gameboy ROM to load"
[bsnes-load-sgameboy]: ../image/core/bsnes/sgb.png
  "Use the file picker menu to select the Super Gameboy ROM to load"
[bsnes-menu1]: ../image/core/bsnes/menu1.png
  "To load a Gameboy ROM into the bsnes core, select Load Super Gameboy at the Main Menu"
[bsnes-menu2]: ../image/core/bsnes/menu2.png
  "To load a Super Gameboy ROM into the bsnes core, select Load Super Gameboy at the Main Menu"
[bsnes-mercury-accuracy]: bsnes_mercury_accuracy.md
  "bsnes-mercury Accuracy (Super NES/Famicom) - Libretro Documentation"
[bsnes-mercury-balanced]: bsnes_mercury_balanced.md
  "bsnes-mercury Balanced (Super NES/Famicom) - Libretro Documentation"
[bsnes-mercury-performance]: bsnes_mercury_performance.md
  "bsnes-mercury Performance (Super NES/Famicom) - Libretro Documentation"
[bsnes-performance]: bsnes_performance.md
  "bsnes Performance (Super NES/Famicom) - Libretro Documentation"
[bsnes-start-gameboy]: ../image/core/bsnes/start.png
  "Launch the content by selecting Start Gameboy at the Main Menu"
[core-info-file]: https://github.com/libretro/libretro-super/blob/master/dist/info/bsnes_accuracy_libretro.info
  "GitHub: libretro-super/dist/info/bsnes_accuracy_libretro.info at master • libretro/libretro-super"
[enwiki-byuu]: https://en.wikipedia.org/wiki/Near_%28programmer%29
  "English Wikipedia: Near (programmer)"
[enwiki-konami-justifier]: https://en.wikipedia.org/wiki/Konami_Justifier
  "English Wikipedia: Konami Justifier"
[enwiki-snes-chips]: https://w.wiki/_s3jA
  "English Wikipedia: List of Super NES games with enhancement chips"
[enwiki-snes-mouse]: https://en.wikipedia.org/wiki/Super_NES_Mouse
  "English Wikipedia: SNES Mouse"
[enwiki-super-scope]: https://en.wikipedia.org/wiki/Super_Scope
  "English Wikipedia: Super Scope"
[fandom-snes-joypad]: https://nintendo.fandom.com/wiki/Super_Nintendo_Entertainment_System_controller
  "Nintendo Wiki: SNES controller"
[fandom-super-multitap]: https://nintendo.fandom.com/wiki/Super_Multitap
  "Nintendo Wiki: Super Multitap"
[github-bsnes-libretro-issues]: https://github.com/libretro/bsnes-libretro/issues
  "GitHub: Issues • libretro/bsnes-libretro"
[github-bsnes-libretro]: https://github.com/libretro/bsnes-libretro
  "GitHub: libretro/bsnes-libretro - bsnes is a Super Nintendo (SNES) emulator focused on performance, features and ease-of-use."
[higan]: https://bsnes.org/higan/
  "Higan - Multi System Emulator"
[higan-accuracy]: higan_accuracy.md
  "higan Accuracy (Super NES/Famicom) - Libretro Documentation"
[higan-accuracy-sgameboy]: higan_accuracy.md#super-gameboy-support
  "higan Accuracy (Super NES/Famicom) § Super Gameboy Support - Libretro Documentation"
[higan-downloads]: https://bsnes.org/higan/download
  "Download Higan Emulator (Windows, Linux & MAC)"
[higan-msu1]: https://higan.readthedocs.io/en/latest/guides/import/#msu1-games
  "Importing and playing games - higan"
[mesen-s]: mesen-s.md
  "Mesen-S (SNES/SFC/Game Boy/Color) - Libretro Documentation"
[nside-balanced]: nside_balanced.md
  "nSide Balanced (Super NES/Famicom) - Libretro Documentation"
[nside-balanced-sgameboy]: nside_balanced.md#super-gameboy-support
  "nSide Balanced (Super NES/Famicom) § Super Gameboy Support - Libretro Documentation"
[ra-licensing]: ../development/licenses.md
  "Licenses - Libretro Documentation"
[rdb-snes]: https://github.com/libretro/libretro-database/blob/master/rdb/Nintendo%20-%20Super%20Nintendo%20Entertainment%20System.rdb
  "GitHub: libretro-database/rdb/Nintendo - Super Nintendo Entertainment System.rdb • libretro/libretro-database"
[rdb-snes-hacks]: https://github.com/libretro/libretro-database/blob/master/rdb/Nintendo%20-%20Super%20Nintendo%20Entertainment%20System%20Hacks.rdb
  "GitHub: libretro-database/rdb/Nintendo - Super Nintendo Entertainment System Hacks.rdb • libretro/libretro-database"
[rdb-sufami-turbo]: https://github.com/libretro/libretro-database/blob/master/rdb/Nintendo%20-%20Sufami%20Turbo.rdb
  "GitHub: libretro-database/rdb/Nintendo - Sufami Turbo.rdb • libretro/libretro-database"
[retromouse]: ../image/retromouse/retro_mouse.png
  "RetroMouse"
[retromouse-left]: ../image/retromouse/retro_left.png
  "RetroMouse Left button"
[retromouse-right]: ../image/retromouse/retro_right.png
  "RetroMouse Right button"
[retropad-a]: ../image/retropad/retro_a.png
  "RetroPad A button"
[retropad-b]: ../image/retropad/retro_b.png
  "RetroPad B button"
[retropad-dpad-down]: ../image/retropad/retro_dpad_down.png
  "RetroPad directional pad Down"
[retropad-dpad-left]: ../image/retropad/retro_dpad_left.png
  "RetroPad directional pad Left"
[retropad-dpad-right]: ../image/retropad/retro_dpad_right.png
  "RetroPad directional pad Right"
[retropad-dpad-up]: ../image/retropad/retro_dpad_up.png
  "RetroPad directional pad Up"
[retropad-l1]: ../image/retropad/retro_l1.png
  "RetroPad L1 shoulder button"
[retropad-r1]: ../image/retropad/retro_r1.png
  "RetroPad R1 shoulder button"
[retropad-select]: ../image/retropad/retro_select.png
  "RetroPad Select button"
[retropad-start]: ../image/retropad/retro_start.png
  "RetroPad Start button"
[retropad-x]: ../image/retropad/retro_x.png
  "RetroPad X button"
[retropad-y]: ../image/retropad/retro_y.png
  "RetroPad Y button"
[snes-controller]: ../image/controller/snes.png
  "Super NES controller button map"
[snes9x]: snes9x.md
  "Snes9x (Super NES/Famicom) - Libretro Documentation"
[snes9x-2002]: snes9x_2002.md
  "Snes9x 2002 (Super NES/Famicom) - Libretro Documentation"
[snes9x-2005]: snes9x_2005.md
  "Snes9x 2005 (Super NES/Famicom) - Libretro Documentation"
[snes9x-2005+]: snes9x_2005_plus.md
  "Snes9x 2005 Plus (Super NES/Famicom) - Libretro Documentation"
[snes9x-2010]: snes9x_2010.md
  "Snes9x 2010 (Super NES/Famicom) - Libretro Documentation"
[snes9x-msu1]: snes9x.md#msu-1-support
  "Snes9x (Super NES/Famicom) § MSU-1 Support - Libretro Documentation"
[softpatching]: ../guides/softpatching.md
  "Softpatching ROMs with RetroArch - Libretro Documentation"
