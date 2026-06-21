---
title: 3D Engine Libretro Core
description: 3D Engine for Libretro GL, 3D/GLES 2.0 and up
icon: material/video-3d
status: stable
---
<!--
  SPDX-FileCopyrightText: © 2018, Daniel De Matteis <libretro@gmail.com>
  SPDX-FileCopyrightText: © 2018, Mohmoud <devmohmoud@gmail.com>
  SPDX-FileCopyrightText: © 2019, Mark W. Kidd <mark@stardart.net>
  SPDX-FileCopyrightText: © 2020, Colin L. Crowley <sanaki@fuzzy-dice.net>
  SPDX-FileCopyrightText: © 2020, Ömercan Kömür <fpscan@gmail.com>
  SPDX-FileCopyrightText: © 2020, Winston Weinert <winston@ml1.net>
  SPDX-FileCopyrightText: © 2022, Gouchi <gouchi@free.fr>
  SPDX-FileCopyrightText: © 2025, Hunter Kaller <hunter_kaller@yahoo.com>
  SPDX-FileCopyrightText: © 2026, Peter J. Mello <admin@petermello.net>

  SPDX-License-Identifier: MIT
-->
## Contribute to this documentation

In order to propose improvements to this document, visit its [source page on
GitHub][3d-engine-doc-source]. From there, you can fork the repository, make
your changes, and propose their usage by opening a "Pull Request."

## Background

A tech demo for libretro GL with additional features (camera, location, etc).

## Installation

1. From the RetroArch main menu, select `Online Updater` --> **`Update Core Info
   Files`** and wait until the update is complete.
1. Go up one level in the menu and this time select `Core Downloader` --> **`3D
   Engine`**. Upon seeing the message in the on-screen display that the download
   has completed, the core should now be ready for use!

## Usage

1. In the RetroArch main menu, click on **`Load Content`**, then browse to the
   folder that contains the content you want to run and select it.
1. If 3D Engine is the only compatible core for it that you have installed, the
   content should launch immediately. In the event that you have multiple
   compatible cores installed, they will be presented as a list of options.
   Select 3D Engine from the list and the content should launch immediately.

### Authors

- [Team Libretro](https://www.libretro.com/)

## License

Please familiarize yourself with the [licenses governing the use and
distribution of RetroArch and its cores][license-summary] so that you understand
the rights and responsibilities involved. In particular, the 3D Engine core is
distributed according to the terms of the [**GNU General Public License, version
3**][3d-engine-license].

## Compatible file extensions

The 3D Engine core is capable of launching content that has one of the following
file extensions:

- `.jpg`
- `.mtl`
- `.obj`
- `.png`

## Feature summary

The 3D Engine core supports these Libretro API features:

| Feature                                         | Supported  |
|:------------------------------------------------|:----------:|
| Restart                                         | ✖          |
| Screenshots                                     | ✔          |
| Saves                                           | ✖          |
| States                                          | ✖          |
| Rewind                                          | ✖          |
| Netplay                                         | ✖          |
| Core Options                                    | ✔          |
| [Memory Monitoring (achievements)][mem-monitor] | ✖          |
| RetroArch Cheats                                | ✖          |
| Native Cheats                                   | ✖          |
| Controls                                        | ✔          |
| Remapping                                       | ✖          |
| Multi-Mouse                                     | ✖          |
| Rumble                                          | ✖          |
| Sensors                                         | ✔          |
| Camera                                          | ✔          |
| Location                                        | ✔          |
| Subsystem                                       | ✖          |
| Softpatching                                    | ✖          |
| Disk Control                                    | ✖          |
| Username                                        | ✖          |
| Language                                        | ✖          |
| Crop Overscan                                   | ✖          |

### Directories

The 3D Engine core's directory name is `Libretro 3DEngine`.

### Geometry and timing

- The 3D Engine core's internal video frame rate is **60.0 FPS**.
- The 3D Engine core's internal audio sample rate is **30.0 kHz**.

## Core options

The 3D Engine core has the following options that can be managed from the `Core
Options` menu. The default value for each setting is shown in bold text, and
those with the annotation _"(Restart)"_ require the core to be exited and
relaunched before any changes to them are applied.

- **Internal resolution** (**`320x240`** / `360x480` / `480x272` / `512x384` /
  `512x512` / `640x240` / `640x448` / `640x480` / `720x576` / `800x600` /
  `960x720` / `1024x768` / `1024x1024` / `1280x720`/ `1280x960` / `1600x1200` /
  `1920x1080` / `1920x1440` / `1920x1600` / `2048x1152` / `2048x1536` /
  `2048x2048`)
- **Cube size** (**`0`** / `1` / `2` / `4` / `8` / `16` / `32` / `64` / `128`)
- **Cube stride** (**`2.0`**–`8.0`, in 1.0 increments)
- **Camera enable** (**`Off`** / `On`)
- **Camera FB Type** (**`texture`** / `raw framebuffer`)
- **Sensor enable** (**`Off`** / `On`)
- **Location enable** (**`Off`** / `On`)
- **Location camera control** (**`Off`** / `On`)
- **Discard hack enable** (**`Off`** / `On`)
- **Location position OSD** (**`Off`** / `On`)

## Input

### Device types

The 3D Engine core supports the following device types in the `Controls` menu;
device types shown in bold text are the default for the specified context.

#### User 1 device types

- None - Doesn't disable input.
- **RetroPad** - Joypad
- RetroPad w/ Analog - Joypad - **There is no reason to switch to this.**

### Controller tables

#### Joypad and other analog device type input mappings

| RetroPad Inputs                                    | Core inputs                              |
|:--------------------------------------------------:|:-----------------------------------------|
| ![B Button][retropad-b]                            | Jump / Zoom in                           |
| ![D-Pad Up][retropad-up]                           | Move forwards                            |
| ![D-Pad Down][retropad-down]                       | Move backwards                           |
| ![D-Pad Left][retropad-left]                       | Turn left                                |
| ![D-Pad Right][retropad-right]                     | Turn right                               |
| ![A Button][retropad-a]                            | Zoom out                                 |
| ![L1 Button][retropad-l1]                          | Move left                                |
| ![R1 Button][retropad-r1]                          | Move right                               |
| ![L2 Trigger][retropad-l2]                         | Adjust lighting                          |
| ![R2 Trigger][retropad-r2]                         | Adjust lighting                          |
| ![R3 Stick Button][retropad-r3]                    | Adjust lighting                          |
| ![Left Stick X-axis][retropad-stick-left] X-axis   | Move right or left/Rotate model          |
| ![Left Stick Y-axis][retropad-stick-left] Y-axis   | Move forwards and backwards/Rotate model |
| ![Right Stick X-axis][retropad-stick-right] X-axis | Look right and left                      |
| ![Right Stick Y-axis][retropad-stick-right] Y-axis | Look up and down/Zoom-in or Zoom-out     |

## External Links

- [3D Engine core info file][3d-engine-core-info]
- [Libretro 3D Engine GitHub repository][github-libretro-3dengine]
- [3D Engine Libretro Core issue tracker][3d-engine-github-issues]

[3d-engine-core-info]: https://github.com/libretro/libretro-super/blob/master/dist/info/3dengine_libretro.info
[3d-engine-doc-source]: https://github.com/libretro/docs/tree/master/docs/library/3d_engine.md
[3d-engine-github-issues]: https://github.com/libretro/libretro-3dengine/issues
[3d-engine-license]: https://github.com/libretro/libretro-3dengine/blob/master/license
[github-libretro-3dengine]: https://github.com/libretro/libretro-3dengine
[license-summary]: ../development/licenses.md
[mem-monitor]: ../guides/memorymonitoring.md
[retropad-a]: ../image/retropad/retro_a.png
[retropad-b]: ../image/retropad/retro_b.png
[retropad-down]: ../image/retropad/retro_dpad_down.png
[retropad-l1]: ../image/retropad/retro_l1.png
[retropad-l2]: ../image/retropad/retro_l2.png
[retropad-left]: ../image/retropad/retro_dpad_left.png
[retropad-r1]: ../image/retropad/retro_r1.png
[retropad-r2]: ../image/retropad/retro_r2.png
[retropad-r3]: ../image/retropad/retro_r3.png
[retropad-right]: ../image/retropad/retro_dpad_right.png
[retropad-stick-left]: ../image/retropad/retro_left_stick.png
[retropad-stick-right]: ../image/retropad/retro_right_stick.png
[retropad-up]: ../image/retropad/retro_dpad_up.png
