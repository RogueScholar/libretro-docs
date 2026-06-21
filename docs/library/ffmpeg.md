---
title: FFmpeg
description: >-2
  An integrated, generic media player for use within Libretro frontends like
  RetroArch.
icon: simple/ffmpeg
status: stable
glightbox: true
---

# Libretro FFmpeg core

<!--
  SPDX-FileCopyrightText: © 2018, Daniel De Matteis <libretro@gmail.com>
  SPDX-FileCopyrightText: © 2018, Mohmoud <devmohmoud@gmail.com>
  SPDX-FileCopyrightText: © 2019, Mark W. Kidd <mark@stardart.net>
  SPDX-FileCopyrightText: © 2019–2025, Hunter Kaller <hunter_kaller@yahoo.com>
  SPDX-FileCopyrightText: © 2020, Colin L. Crowley <sanaki@fuzzy-dice.net>
  SPDX-FileCopyrightText: © 2020–2022, Ömercan Kömür <fpscan@gmail.com>
  SPDX-FileCopyrightText: © 2020, Winston Weinert <winston@ml1.net>
  SPDX-FileCopyrightText: © 2024–2026, Peter J. Mello <admin@petermello.net>
  SPDX-FileCopyrightText: © 2026, Tobias Pampinella <tobiaspampinella@users.noreply.github.com>

  SPDX-License-Identifier: MIT
-->
The Libretro FFmpeg core is an audio/video player implementation for the
Libretro API. FFmpeg can play multimedia files of many different formats within
RetroArch. If a video file has multiple embedded audio tracks, FFmpeg can switch
between them. Likewise, if there are multiple hard-coded subtitles in the file,
it can switch between them, too.

## Author/License

The FFmpeg core has been authored by…

- [**Fabrice Bellard**][enwiki-fbellard], and
- **the FFmpeg team**

…and is distributed under the terms of the

- [GNU Lesser General Public License, version 2.1 (or later)][ffmpeg-license],
  and the
- [GNU General Public License, version 2.0 (or later)][ffmpeg-license].

A [summary of the licenses governing the use and distribution RetroArch and its
cores][ra-licensing] is also available.

## User experience

???+ success "Copyright non-infringement"
    RetroArch and Libretro do not share or distribute any unlicensed,
    copyrighted content. RetroArch does not download any media files nor does it
    play content streams from external platforms or services.

### Video playback

#### Video configuration

<iframe allow="accelerometer 'self'; clipboard-write *; display-capture 'self'; encrypted-media 'src';
  fullscreen *; geolocation 'src'; gyroscope 'self'; hid 'self'; picture-in-picture *; screen-wake-lock *;
  web-share *;" aria-label="YouTube video" height="315" width="560" loading="lazy" role="application"
  name="YouTube embedded player" title="LibRetro: Watching movies with RetroArch" referrerpolicy="strict-origin-when-cross-origin"
  sandbox="allow-orientation-lock allow-popups allow-presentation allow-same-origin allow-scripts"
  src="https://www.youtube-nocookie.com/embed/zget1P8ptho?origin=docs.libretro.com&playsinline=1"
  style="border-collapse: collapse; border-style: hidden; display: block; margin: 1.5rem auto 2rem; position: relative;"></iframe>

#### Subtitles

You can open video files in the following formats (see: [§ File
extensions][file-extensions]). If your video file in these formats has a
subtitle file encoded with `.ssa` type, these subtitle files will appear
automatically. External subtitles are currently not supported. The video files
you have played will be added to the Videos section in the main menu.

??? example "95's Ghost in the Shell playing with Turkish subtitles"
    <figure markdown="span">
      ![Ghost in the Shell][gits-subs]{ data-gallery="subtitles" width="360" }
    </figure>

### Audio playback

You can open audio files in the following formats (see: [§ File
extensions][file-extensions]). In the example below, you can see and listen to
an mp3 file running at the lowest settings. File quality will affect sound
quality. The audio files you have played will be added to the Music section in
the main menu.

??? example "Combined playback of split audio/video streams"
    <video width="480" height="360" controls>
      <source src="/image/core/ffmpeg/audio-preview.mp4" type="video/mp4">
      <source src="/image/core/ffmpeg/audio-preview.ogg" type="video/ogg">
      Your browser does not support the video tag.
    </video>

#### Audio configuration

<iframe allow="accelerometer 'self'; clipboard-write *; display-capture 'self'; encrypted-media 'src';
  fullscreen *; geolocation 'src'; gyroscope 'self'; hid 'self'; picture-in-picture *; screen-wake-lock *;
  web-share *;" aria-label="YouTube video" height="315" width="560" loading="lazy" role="application"
  name="YouTube embedded player" title="LibRetro: Listening to music with RetroArch" referrerpolicy="strict-origin-when-cross-origin"
  sandbox="allow-orientation-lock allow-popups allow-presentation allow-same-origin allow-scripts"
  src="https://www.youtube-nocookie.com/embed/5f6nWBpagaM?origin=docs.libretro.com&playsinline=1"
  style="border-collapse: collapse; border-style: hidden; display: block; margin: 1.5rem auto 2rem; position: relative;"></iframe>

## File extensions

Content that can be loaded by the Libretro FFmpeg core will have one of the
following file extensions:

- **Audio/video formats:**
    + `.3g2`/`.3gp`
    + `.asf`/`.wmv`
    + `.avi`
    + `.divx`
    + `.f4f`/`.f4v`/`.flv`
    + `.m2p`
    + `.m2ts`
    + `.mkv`
    + `.mov`
    + `.mp4`
    + `.mpeg`/`.mpg`
    + `.mxf`
    + `.ogm`/`.ogv`/`.ogx`
    + `.ps`
    + `.ts`
    + `.vob`
    + `.webm`
- **Audio-only formats:**
    + `.f4a`/`.f4b`/`.fla`
    + `.flac`
    + `.m4a`/`.m4b`
    + `.mp3`
    + `.oga`/`.ogg`
    + `.wav`
    + `.wma`

## Features

Frontend-level settings or features that the FFmpeg core respects:

{{ read_csv('ffmpeg-features.csv', colalign=('right','center'), comment='#') }}

### Directories

The Libretro FFmpeg core's directory name is '`FFmpeg`'.

### Geometry and timing

The Libretro FFmpeg core provides…

- …a refresh rate that is dependent on the loaded media.
- …an audio sample rate that is dependent on the loaded media.
- …video output with an aspect ratio that is dependent on the loaded media.

### Shaders

Shaders can improve your viewing quality, as well as recreate the experience of
viewing it on hardware from the 80s or 90s. In the example below, you can see
how a VHS shader effect can affect the viewing quality. You can also provide
more innovative playback styles by stacking shaders on top of each other.

??? example "Screenshot: Shaders"
    <figure markdown="span">
      ![VHSPro shader][vhspro-shader]{ data-gallery="shader" width="360" }
    </figure>

## Core options

The Libretro FFmpeg core has the following options which can be customized using
the `Core Options` menu. The corresponding configuration file key names are
shown in [`square brackets`] and default values are indicated with ✪.

{{ read_csv('ffmpeg-options.csv', colalign=('center','center','left'), comment='#') }}

??? example "Screenshots: FFT Resolution"
    ![320×180][fft-320]{ data-gallery="fft-res" width="360" }
    &emsp;&emsp;
    ![3840×2160][fft-3840]{ data-gallery="fft-res" width="360" }

??? example "Screenshots: Colorspace"
    ![BT.601][bt601]{ data-gallery="colorspace" width="200" }
    &emsp;&emsp;
    ![FCC][]{ data-gallery="colorspace" width="200" }
    &emsp;&emsp;
    ![BT.709][bt709]{ data-gallery="colorspace" width="200" }
    &emsp;&emsp;
    ![SMPTE240M][]{ data-gallery="colorspace" width="200" }

## Input devices

The FFmpeg core supports the following device type(s) in the controls menu.
Default device types for the specified user(s) are shown in **boldface**.

### User 1

{{ read_csv('ffmpeg-input-user1.csv', colalign=('center','center'), comment='#') }}

### Device tables

#### Gamepad

{{ read_csv('ffmpeg-input-gamepad.csv', colalign=('center','center'), comment='#') }}

#### Mouse

The FFmpeg core provides Wheel Up and Wheel Down mouse inputs for seeking
through content. This is always active and fully independent of the device types
in the Controls menu; it cannot be manually enabled or disabled.

{{ read_csv('ffmpeg-input-mouse.csv', colalign=('center','center'), comment='#') }}

## External links

- **FFmpeg (upstream project):**
    + [Official Website][ffmpeg]
    + [Source Code Repositories][ffmpeg-vcs]
- **Libretro FFmpeg core:**
    + [Core info file][core-info-file]
    + [Internal Libretro core source code][internal-vcs]
    + [Issue Tracker][gh-issues]

[bt601]: ../image/core/ffmpeg/BT.601.webp
  "Screenshot: BT.601 colorspace"
[bt709]: ../image/core/ffmpeg/BT.709.webp
  "Screenshot: BT.709 colorspace"
[colorspaces]: https://trac.ffmpeg.org/wiki/colorspace
  "Colorspace support in FFmpeg – FFmpeg Wiki"
[core-info-file]: https://github.com/libretro/libretro-super/blob/master/dist/info/ffmpeg_libretro.info
  "GitHub: libretro-super/dist/info/ffmpeg_libretro.info on master • libretro/libretro-super"
[enwiki-fbellard]: https://en.wikipedia.org/wiki/Fabrice_Bellard
  "English Wikipedia: Fabrice Bellard"
[fcc]: ../image/core/ffmpeg/FCC.webp
  "Screenshot: FCC colorspace"
[ffmpeg]: https://ffmpeg.org/
  "FFmpeg - A complete, cross-platform solution to record, convert and stream audio and video"
[ffmpeg-license]: https://github.com/libretro/FFmpeg/blob/master/LICENSE.md
  "GitHub: FFmpeg/LICENSE.md on master • libretro/FFmpeg"
[ffmpeg-vcs]: https://ffmpeg.org/download.html#repositories
  "FFmpeg - Git Repositories"
[fft-320]: ../image/core/ffmpeg/320x180.png
  "Screenshot: FFT Resolution set to 320px×180px"
[fft-3840]: ../image/core/ffmpeg/3840x2160.png
  "Screenshot: FFT Resolution set to 3840px×2160px"
[file-extensions]: #file-extensions
  "FFmpeg § File extensions - Libretro Documentation"
[gh-issues]: https://github.com/libretro/RetroArch/issues
  "GitHub: Issues • libretro/FFmpeg"
[gits-subs]: ../image/core/ffmpeg/subtitle.webp
  "Screenshot: Ghost in the Shell with embedded subtitles shown"
[internal-vcs]: https://github.com/libretro/RetroArch/tree/master/cores/libretro-ffmpeg
  "GitHub: RetroArch/cores/libretro-ffmpeg on master • libretro/RetroArch"
[ra-licensing]: ../development/licenses.md
  "Licenses - Libretro Documentation"
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
[rpad-r1]: ../image/retropad/retro_r1.png
  "RetroPad R1 right shoulder button"
[shaders]: #shaders
  "FFmpeg § Shaders - Libretro Documentation"
[smpte240m]: ../image/core/ffmpeg/SMPTE240M.webp
  "Screenshot: SMPTE240M colorspace"
[softpatching]: ../guides/softpatching.md
  "Softpatching ROMs with RetroArch - Libretro Documentation"
[vhspro-shader]: ../image/core/ffmpeg/shader1.png
  "Screenshot: Video playback with the VHSpro shader enabled"
