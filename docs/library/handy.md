---
title: Handy (Lynx)
description: An Atari Lynx emulator for Libretro frontends, like RetroArch.
icon: simple/atari
status: stable
glightbox: true
---

# Libretro Handy core

Handy is an Atari Lynx video game system emulator that can be used as a libretro
core. Handy was the original name of the Lynx project that was started at Epyx
and then finished by Atari.

## Author/License

The Handy core's original author is

- **K. Wilkins**

and it is distributed under the terms of the

- [Zlib License][handy-license].

A [summary of the licenses governing the use and distribution RetroArch and its
cores][ra-licensing] is also available.

## Extensions

Content that can be loaded by the Handy core has the following file extension:

- `.lnx`

## Databases

RetroArch database(s) that are associated with the Handy core:

- [Atari - Lynx][rdb-lynx]

## BIOS

Required or optional firmware files go in the frontend's **system** directory.

|    Filename     |    Description             |            MD5 Checksum            |
|:---------------:|:--------------------------:|:----------------------------------:|
| `lynxboot.img`  | Lynx Boot Image (required) | `fcd403db69f54290b51035d82f835e7b` |

## Features

Frontend-level settings or features that the Handy core respects:

{{ read_csv('handy-features.csv', colalign=('right','center'), comment='#') }}

### Directories

The Libretro Handy core's directory name is 'Handy', and it saves to/loads from
these directories:

**Frontend's State directory**

:   `<content_name>.state`

### Geometry and timing

The Libretro Handy core provides…

- …a refresh rate of 75 frames/second.
- …an audio sample rate of 22050 Hz.
- …video output with an aspect ratio that is dependent on the
  [`Display rotation` core option][core-options]. When set to `None`, the aspect
  ratio will be 80:51, and when set to `90` or `240`, the aspect ratio will be
  51:80.

## Core options

The Libretro Handy core has the following option that can be defined using the
`Core Options` menu. The default setting is bolded.

- **Display rotation** [handy_rot] (**None**/90/240)

	Self-explanatory. Need to restart content.

## Controllers

The Handy core supports the following device type(s) in the controls menu, bolded device types are the default for the specified user(s):

### User 1 device types

- None - Doesn't disable input.
- **RetroPad** - Joypad
- RetroPad w/Analog - Joypad - There's no reason to switch to this.

### Controller tables

#### Joypad

!!! info inline end "Atari Lynx controller (click to expand)"
    ![Atari Lynx controller map][lynx-controller-map]{ data-gallery="controller" width="360" }

| RetroPad Inputs                             | User 1 Remap descriptors |
|---------------------------------------------|--------------------------|
| ![](../image/retropad/retro_b.png)          | B                        |
| ![](../image/retropad/retro_start.png)      | Pause                    |
| ![](../image/retropad/retro_dpad_up.png)    | D-Pad Up                 |
| ![](../image/retropad/retro_dpad_down.png)  | D-Pad Down               |
| ![](../image/retropad/retro_dpad_left.png)  | D-Pad Left               |
| ![](../image/retropad/retro_dpad_right.png) | D-Pad Right              |
| ![](../image/retropad/retro_a.png)          | A                        |
| ![](../image/retropad/retro_l1.png)         | Option 1                 |
| ![](../image/retropad/retro_r1.png)         | Option 2                 |

Supported combinations

- Option 1 + Pause = Restarts game
- Option 2 + Pause = Flips Screen

## Compatibility

| Game         | Issue                                                                   |
|--------------|-------------------------------------------------------------------------|
| RoadBlasters | Graphics glitches. Minor flickering and glitches after starting a race. |

## See also

### Other Atari Lynx Libretro cores

- [Beetle Lynx][beetle-lynx]

## External links

- **Handy Emulator** (upstream project):
    + [Official Website][handy]
    + [Downloads][handy-downloads]
- **Libretro Handy core:**
    + [Core info file][core-info-file]
    + [Source code repository][core-vcs]
    + [Issue tracker][core-issues]
- [Gameplay Videos][gameplay-playlist]

[beetle-lynx]: beetle_lynx.md
[core-info-file]: https://github.com/libretro/libretro-super/blob/master/dist/info/handy_libretro.info
[core-issues]: https://github.com/libretro/libretro-handy/issues
[core-options]: #core-options
[core-vcs]: https://github.com/libretro/libretro-handy
[gameplay-playlist]: https://www.youtube.com/playlist?list=PLRbgg4gk_0IfDlFKLg0HMDXbn8BrcxbJV
[handy]: https://handy.sourceforge.net/
[handy-downloads]: https://handy.sourceforge.net/download.htm
[handy-license]: https://sourceforge.net/projects/handy/
[lynx-controller-map]: ../image/controller/lynx.png
[ra-licensing]: ../development/licenses.md
[rdb-lynx]: https://github.com/libretro/libretro-database/blob/master/rdb/Atari%20-%20Lynx.rdb
[softpatching]: ../guides/softpatching.md
