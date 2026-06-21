---
title: Dolphin (GameCube/Wii)
description: >-2
  A Nintendo Gamecube and Wii emulator for Libretro frontends like RetroArch.
icon: cores/dolphin
status: stable
---

# Libretro Dolphin core :cores-dolphin:

The **Libretro Dolphin core** is a Nintendo Gamecube/Wii emulator for Android,
Windows, Mac and Linux, written in C++, that supports the [OpenGL][],
[Vulkan][], and [Direct3D 11][d3d11] graphics APIs.

<iframe allow="accelerometer 'self'; clipboard-write *; display-capture 'self'; encrypted-media 'src';
  fullscreen *; geolocation 'src'; gyroscope 'self'; hid 'self'; picture-in-picture *; screen-wake-lock *;
  web-share *;" aria-label="YouTube video" height="315" width="560" loading="lazy" role="application"
  name="YouTube embedded player" title="RetroArch - How to Setup: Dolphin" referrerpolicy="strict-origin-when-cross-origin"
  sandbox="allow-orientation-lock allow-popups allow-presentation allow-same-origin allow-scripts"
  src="https://www.youtube-nocookie.com/embed/ayv-zf04HsQ?origin=docs.libretro.com&playsinline=1"
  style="border-collapse: collapse; border-style: hidden; display: block; margin: 1.5rem auto 2rem; position: relative;"></iframe>

## Licensing

The Libretro Dolphin core is distributed under the terms of the

- [GPL-2.0-or-later][dolphin-license] license.

A summary of the [licenses governing the use and distribution of RetroArch and
its cores][ra-licensing] is also available.

## System requirements

The Libretro Dolphin core includes native rendering support for three modern,
low-level graphics APIs. Your computer's graphics subsystem must meet or exceed
the required specification level for at least one or more of these to use
Dolphin.

|   Renderer   | Minimum specification level | Recommended specification level        |
|:------------:|:----------------------------|:---------------------------------------|
| **OpenGL**   | OpenGL 3.0 / OpenGL ES 3.0  | OpenGL 4.4 / OpenGL ES 3.2, or higher  |
| **Vulkan**   | Vulkan 1.0                  | Vulkan 1.1 or higher                   |
| **Direct3D** | Direct3D 11.0               | Direct3D 11.1 / Direct3D 12, or higher |

## Setup

### `Sys` folder

Proper functioning of the Libretro Dolphin core requires a copy of the Dolphin
emulator's `Sys` folder and its contents to be accessible at a specific location
in your filesystem. After downloading the Dolphin core within RetroArch, use one
of the following three methods to acquire a copy of the `Sys` folder to use with
it, if you don't yet have one.

!!! tip "Desired outcome"
    Success at this task is achieved when a copy of the `Sys` folder, as found
    at `Data/Sys` in the Dolphin core's GitHub repository, is placed at the
    location defined in RetroArch's configuration as
    `RETROARCH_SYSTEM_FOLDER/dolphin-emu`.

#### A. Core System Files Downloader

If your Libretro frontend includes the `Core System Files Downloader` option
under `Main Menu` --> `Online Updater`, that is the most reliable and expedient
method for acquiring a copy of the `Sys` folder. Select that command and then
find `Dolphin.zip` in the list of available downloads, and the necessary files
will be extracted and placed in the proper location.

#### B. Code repository using Git

If the Online Updater is not an option or fails to extract the files for some
reason, then you will have to retrieve the Dolphin core's source code (hosted on
GitHub) and move the `Sys` folder from within it to where your Libretro frontend
expects it to be. There are two methods by which to go about this; choosing the
more appropriate one for you depends on whether or not you are able to use the
[**Git** version control software][git-downloads] on your device.

- **If you have Git installed (if not, see the next option):** Just clone the
  entire repository's current state to any convenient location on your system
  with the terminal command:

    ``` shell
    git clone --depth=1 https://github.com/libretro/dolphin.git
    ```

#### C. GitHub `master.zip` file

GitHub provides a convenient `master.zip` archive file for every hosted public
repository that is freely available to download and from which you can manually
extract the `Sys` folder to place in the appropriate directory (just as the
Online Updater would). [**This link**][gh-dl-master] will start a download of
the Dolphin core repository `master.zip` file (~45MiB as of August 2024) from
GitHub.

1. Once the download is complete, extract the archive using any standard archive
   file utility.
    + [PeaZip][] is one such utility that's free, reliable and easy-to-use, if
      you don't have one; it runs on Windows, macOS and Linux. Likewise on
      Android devices, ZArchiver is a free and well-regarded archive file
      handler ([Google Play Store][zarchiver-android]).
1. You'll find a folder named `dolphin-master` was created by extracting the ZIP
   file. Open it, and then open the `Data` folder you'll find inside it. The
   `Sys` folder you'll encounter there is what contains the files Dolphin needs.
   (Approximately 2,000 files in total, but requiring only ~5MiB of disk space.)
1. Determine your RetroArch `system` folder path. If you have not modified your
   installation, the RetroArch configuration path will match the location shown
   in the [RGUI documentation][rgui-conf-file] named
   `RETROARCH_CONFIG_DIR/system`. If your configuration _has_ been altered from
   the defaults, inspect your `retroarch.cfg` file and find the
   `system_directory` key to determine which folder is used.
1. In the folder you identified in the previous step, verify that a directory
   named `dolphin-emu` exists, and if it does not, create it with exactly that
   name.
1. Move or copy the `Sys` folder recursively (i.e., with all its contents) to
   the `RETROARCH_SYSTEM_FOLDER/dolphin-emu` directory from the previous step.

There is also currently a bug with this core and the `gl` driver that can be
resolved by going to `Settings` --> `User Interface` -->
`Show Advanced Settings` to ensure that it is turned `ON`, then navigating to
`Settings` --> `Core` --> `Allow Cores to Change the Video Driver` and setting
that to `OFF`.

The Dolphin core should now work without issue.

### BIOS

The (optional) BIOS file must be placed in the
`retroarch/saves/User/GC/<locale>` directory with the file name `IPL.bin`, where
`<locale>` is one of:

- `USA`
- `EUR`
- `JAP`

It is not necessary to provide a BIOS for most games, but certain titles
(particularly those which make heavy use of the system fonts, like Star Fox
Assault) may be unplayable without it.

!!! tip "Gamecube BIOS (startup) animation"
    To play the [Gamecube BIOS animation][gc-bios-ani] (embedded below) at game
    launch, with the aforementioned `IPL.bin` file in place, open the
    `retroarch/saves/User/Config/Dolphin.ini` file in a text editor and change
    the value of `SkipIPL` from `True` to `False`.

<iframe allow="accelerometer 'self'; clipboard-write *; display-capture 'self'; encrypted-media 'src';
  fullscreen *; geolocation 'src'; gyroscope 'self'; hid 'self'; picture-in-picture *; screen-wake-lock *;
  web-share *;" aria-label="YouTube video" height="315" width="560" loading="lazy" role="application"
  name="YouTube embedded player" title="Nintendo Gamecube Intro *Original Not A Meme*" referrerpolicy="strict-origin-when-cross-origin"
  sandbox="allow-orientation-lock allow-popups allow-presentation allow-same-origin allow-scripts"
  src="https://www.youtube-nocookie.com/embed/CpmYW-gCSy4?origin=docs.libretro.com&playsinline=1"
  style="border-collapse: collapse; border-style: hidden; display: block; margin: 1.5rem auto 2rem; position: relative;"></iframe>

## Core information

### File extensions

Content that can be loaded by the Dolphin core will have one of the following
file extensions:

- `.elf`
- `.iso`
- `.gcm`
- `.dol`
- `.tgc`
- `.wbfs`
- `.ciso`
- `.gcz`
- `.wad`
- `.rvz`

### Databases

RetroArch databases that are associated with the Dolphin core:

- [Nintendo - GameCube][rdb-gamecube]
- [Nintendo - Wii][rdb-wii]

### Features

These are the frontend-level features and configuration options that the Dolphin
core supports.

|           Feature |     Supported      |
|------------------:|:------------------:|
| Restart           | :white_check_mark: |
| Saves             | :white_check_mark: |
| States            | :white_check_mark: |
| Rewind            | :white_check_mark: |
| Netplay           | ❌                 |
| Core Options      | :white_check_mark: |
| RetroAchievements | ❌                 |
| RetroArch Cheats  | ❌                 |
| Native Cheats     | :white_check_mark: |
| Controls          | :white_check_mark: |
| Remapping         | :white_check_mark: |
| Multi-Mouse       | ❌                 |
| Rumble            | ❌                 |
| Sensors           | ❌                 |
| Camera            | ❌                 |
| Location          | ❌                 |
| Subsystem         | ❌                 |
| [Softpatching][]  | ❌                 |
| Disk Control      | ❌                 |
| Username          | ❌                 |
| Language          | :white_check_mark: |
| Crop Overscan     | ❌                 |
| LEDs              | ❌                 |

### Compatibility

The upstream Dolphin Emulator developers maintain a highly extensive
[compatibility list][compatibility] detailing the overall quality of Dolphin's
emulation for most officially released titles, along with any specific issues
and potential workarounds.

### Directories

The Dolphin core's library name is 'Dolphin'

### Geometry and timing

The Libretro Dolphin core provides…

- …a refresh rate of 60 frames/second for NTSC and 50 frames/second for PAL.
- …an audio sample rate of either 32000 Hz or 48000 Hz, depending on user
  configuration.
- …a base width and base height which are dependent on the 'Internal Resolution'
  core option.
- …a maximum width and maximum height which are dependent on the 'Internal
  Resolution' core option.
- …video output with an aspect ratio of 4:3.

### Language

When the `Language` core option is set to automatic, the default Dolphin
language setting will be pulled from RetroArch's `Language` setting.

### Internal Cheats

Disabled by default.

## Graphics APIs

### Vulkan

Dolphin's Vulkan renderer can be used by setting RetroArch's video driver to
`vulkan`.

This is the newest and most performant API, currently, and can run on any
Vulkan-compliant hardware, though best results are achieved with equipment that
satisfies at least the Vulkan 1.1 specification. It is highly recommended for
its much lower demands on your CPU resources.

### OpenGL

Dolphin's OpenGL renderer can be used by setting RetroArch's video driver to
`gl`.

The OpenGL renderer is the only one common to all operating systems, requiring
hardware that supports OpenGL 3.0 or OpenGL ES 3.0 at a minimum. It is an older,
pre-Vulkan API, widely regarded as the slowest of Dolphin's renderers, but with
the widest compatibility, as the OpenGL 3.0 specification was published in 2008
and is generally satisfied by graphics hardware of roughly the same vintage. If
you encounter problems with other APIs, try this one.

### Direct3D (D3D11)

Dolphin's Direct3D 11 renderer can be used by setting RetroArch's video driver
to `d3d11`.

Direct3D is a Windows-specific graphics API and is known to function well with
hardware from all manufacturers. In some cases it may offer better performance
than OpenGL, especially on integrated Intel graphics.

## Core options

The Dolphin core has the following option(s) that can be customized from the
`Core Options` menu. The corresponding configuration file key names are shown in
[`square brackets`] and default values are indicated with ✪.

{{ read_csv('dolphin-options.csv', colalign=('center','left'), comment='#') }}

## Core inputs

{{ read_csv('dolphin-inputs.csv', colalign=('center','center','center','center','center','center','center'), comment='#') }}

## External Links

- [Gameplay Videos][playlist-gameplay]
- **Dolphin Emulator** (upstream project):
    + [Official Website][dolphin]
    + [Source Code Repository][github-dolphin] (GitHub)
- **Libretro Dolphin core:**
    + [Core info file][core-info-file]
    + [Issue Tracker][github-issues]

[compatibility]: https://dolphin-emu.org/compat/
  "Dolphin Emulator - Compatibility List"
[core-info-file]: https://github.com/libretro/libretro-super/blob/master/dist/info/dolphin_libretro.info
  "GitHub: libretro-super/dist/info/dolphin_libretro.info at master • libretro/libretro-super"
[d3d11]: #direct3d-d3d11
  "Dolphin (GameCube/Wii) § Direct3D (D3D11) - Libretro Documentation"
[dolphin]: https://dolphin-emu.org/
  "Dolphin Emulator - GameCube/Wii games on PC"
[dolphin-license]: https://github.com/libretro/dolphin/blob/master/license.txt
  "GitHub: dolphin/license.txt at master • libretro/dolphin"
[gc-bios-ani]: https://www.youtube.com/watch?v=CpmYW-gCSy4
  "Nintendo Gamecube Intro *Original Not A Meme* - YouTube"
[gh-dl-master]: https://github.com/libretro/dolphin/archive/refs/heads/master.zip
  "GitHub: Download ZIP • libretro/dolphin"
[git-downloads]: https://git-scm.com/downloads
  "Git - Downloads"
[github-dolphin]: https://github.com/dolphin-emu/dolphin
  "GitHub: dolphin-emu/dolphin - Dolphin is a GameCube / Wii emulator, allowing you to play games for these two platforms on PC with improvements."
[github-issues]: https://github.com/libretro/dolphin/issues
  "GitHub: Issues • libretro/dolphin"
[opengl]: #opengl
  "Dolphin (GameCube/Wii) § OpenGL - Libretro Documentation"
[peazip]: https://peazip.github.io/
  "PeaZip free archiver utility, open/extract RAR TAR ZIP files"
[playlist-gameplay]: https://www.youtube.com/playlist?list=PLRbgg4gk_0IcC4j9ggvxzZm2GiuufDMeU
  "@Libretro: Dolphin (playlist) - YouTube"
[ra-licensing]: ../development/licenses.md
  "Licenses - Libretro Documentation"
[rdb-gamecube]: https://github.com/libretro/libretro-database/blob/master/rdb/Nintendo%20-%20GameCube.rdb
  "GitHub: libretro-database/rdb/Nintendo - GameCube.rdb on master • libretro/libretro-database"
[rdb-wii]: https://github.com/libretro/libretro-database/blob/master/rdb/Nintendo%20-%20Wii.rdb
  "GitHub: libretro-database/rdb/Nintendo - Wii.rdb on master • libretro/libretro-database"
[rpad-a]: ../image/retropad/retro_a.png
  "RetroPad A button"
[rpad-b]: ../image/retropad/retro_b.png
  "RetroPad B button"
[rpad-dpad-down]: ../image/retropad/retro_dpad_down.png
  "RetroPad directional pad Down"
[rpad-dpad-left]: ../image/retropad/retro_dpad_left.png
  "RetroPad directional pad Left"
[rpad-dpad-right]: ../image/retropad/retro_dpad_right.png
  "RetroPad directional pad Right"
[rpad-dpad-up]: ../image/retropad/retro_dpad_up.png
  "RetroPad directional pad Up"
[rpad-l1]: ../image/retropad/retro_l1.png
  "RetroPad L1 left shoulder button"
[rpad-l2]: ../image/retropad/retro_l2.png
  "RetroPad L2 left analog trigger"
[rpad-l3]: ../image/retropad/retro_l3.png
  "RetroPad L3 left analog stick button"
[rpad-lstick]: ../image/retropad/retro_left_stick.png
  "RetroPad left analog stick"
[rpad-r1]: ../image/retropad/retro_r1.png
  "RetroPad R1 right shoulder button"
[rpad-r2]: ../image/retropad/retro_r2.png
  "RetroPad R2 right analog trigger"
[rpad-r3]: ../image/retropad/retro_r3.png
  "RetroPad R3 right analog stick button"
[rpad-rstick]: ../image/retropad/retro_right_stick.png
  "RetroPad right analog stick"
[rpad-select]: ../image/retropad/retro_select.png
  "RetroPad Select button"
[rpad-start]: ../image/retropad/retro_start.png
  "RetroPad Start button"
[rpad-x]: ../image/retropad/retro_x.png
  "RetroPad X button"
[rpad-y]: ../image/retropad/retro_y.png
  "RetroPad Y button"
[rgui-conf-file]: ../guides/rgui.md#config-file
  "RGUI interface style § Configuration file - Libretro Documentation"
[softpatching]: ../guides/softpatching.md
  "Softpatching ROMs with RetroArch - Libretro Documentation"
[vulkan]: #vulkan
  "Dolphin (GameCube/Wii) § Vulkan - Libretro Documentation"
[zarchiver-android]: https://play.google.com/store/apps/details?id=ru.zdevs.zarchiver
  "ZArchiver - Apps on Google Play"
