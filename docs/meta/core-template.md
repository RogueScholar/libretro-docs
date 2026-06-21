---
title: Core documentation template
description: >-2
  A documentation scaffold to help authors of documentation for new cores.
icon: octicons/project-template-16
status: stable
glightbox: true
---

<!--
  This core documentation template does not need to be followed to the letter;
  this is meant only as an aid to writing a thorough page. Document your new
  core in the way that feels most natural and informative to you.
-->

# [Title]

- // [Title] is the display name entry from the core's info file
- // https://github.com/libretro/libretro-super/tree/master/dist/info

## Background

[Background info]

- // Add [Background] info for the core here, use google for background info

The [Core name] core has been authored by:

- [Author]

- // Add [Core name]
- // [Author] is the display name entry from the core's info file
- // https://github.com/libretro/libretro-super/tree/master/dist/info

The [Core name] core is licensed under:

- [License][core-license-file]

- // Add [Core name]
- // Add [License], sourcing the information from the core info file, the
  licenses doc or google, and enter the URL to the source document as the value
  for the "core-license-file" reference-style link at the bottom of the page.
- // https://github.com/libretro/libretro-super/tree/master/dist/info
- // https://docs.libretro.com/development/licenses/

A summary of the [licenses governing the use and distribution of RetroArch and
its cores][ra-licensing] is also available.

## Requirements

[Requirements]

- // Add [Requirements] such as hardware or software requirements for the core
  // here.

## How to start the [Core name] core:

- // This section is for cores that need to be started in a special way

- // Use this example section for cores that need files from RetroArch's
  // Content Downloader

- To start the [Core name] core, you need to obtain [Core name]'s data files.
  You can do this by going to RetroArch's main menu screen and selecting 'Online
  Updater'. From there, select 'Content Downloader'.

- // Fill in the [Core name]

- Select '[Content directory name]', then select '[Game filename]'. This should
  download and extract this file to RetroArch's Downloads directory.

- // Fill in the [Content directory name] and the [Game filename]

- Go back to RetroArch's main menu screen. Select 'Load Content', then
  'Downloads'.

- Select the '[Content directory name]' directory, then select
  '[Game filename]'.

- // Fill in the [Content directory name] and the [Game filename]

- If you are asked which core to select, choose '[Title]'.

- // Fill in the [Title]

The content should now start running!

- /// Use this example section for cores that don't need content to be started

- To start the [Core name] core, go to RetroArch's main menu screen. Select
  'Load Core', then '[Core name]'.

- // Fill in the [Core name]

- Now, select 'Start Core'.

The content should now start running!

## BIOS

- // Add firmware information from the core info file here
- // https://github.com/libretro/libretro-super/tree/master/dist/info)
- // For core that don't need BIOS, either say BIOS not required or just not
  // include a BIOS section

[Required or optional firmware files][bios] go in the frontend's system
directory:

| Filename          | Description                     | md5sum                           |
|:-----------------:|:-------------------------------:|:--------------------------------:|
| bios_filename.bin | Description - Optional/Required |                                  |

## Extensions

Content that can be loaded by the [Core name] core have the following file
extensions:

- // Fill in the [Core name]

- .[extension]

// Copy the extension entry from the core info file and paste it here.
<https://github.com/libretro/libretro-super/tree/master/dist/info> Also look at
the core's libretro.c/libretro.cpp file, sometimes the core info files can get
out of sync.

RetroArch database(s) that are associated with the [Core name] core:

- // Fill in the [Core name]
- [Database name][database-file]
- // Add database entries from the core info file here and add the URL from
  libretro-database repo to the "database-file" reference-style link at the
  bottom of the page.
- // https://github.com/libretro/libretro-super/tree/master/dist/info
- // https://github.com/libretro/libretro-database/tree/master/rdb

## Features

Frontend-level settings or features that the [Core name] core respects:

- // Fill in the [Core name]
- // Open docs/tables/core-template-features.csv in your favorite spreadsheet
  editor and set the proper symbols using :white_check_mark:, ❌,
  :material-checkbox-blank-off-outline: or leave it as-is, if unsure.
- // Save file as docs/tables/core_name-features.csv and update file name below.

{{ read_csv('core-template-features.csv', colalign=('right','center'), comment='#') }}

## Directories

- // This section is a list of files and/or directories the core creates in
  certain directories.

The [Core name] core's library name is '[Library name]'

- // Add [Core name] and the [Library name]. Check libretro.c/.cpp for
  [Library name].

The [Core name] core saves/loads to/from these directories.

// Fill in the [Core name]

- // Add a list of directories/files the core uses
- // The Home, Appdata directories sections are rarely used, they're only for
  cores that don't follow the libretro API closely.

**Frontend's Home directory**

| File         | Description |
|:------------:|:-----------:|
| filename.bin | Description |

**Frontend's Save directory**

| File         | Description |
|:------------:|:-----------:|
| filename.bin | Description |

**Frontend's State directory**

| File         | Description |
|:------------:|:-----------:|
| filename.bin | Description |

**Frontend's System directory**

| File         | Description |
|:------------:|:-----------:|
| filename.bin | Description |

**Loaded content's directory**

| File         | Description |
|:------------:|:-----------:|
| filename.bin | Description |

**Appdata directory**

| File         | Description |
|:------------:|:-----------:|
| filename.bin | Description |

## Geometry and timing

// Add [Core name], [FPS], [Sample rate], [Base width], [Base height],
[Max width], [Max height], [Aspect ratio]

- The [Core name] core's core provided FPS is [FPS]
- The [Core name] core's core provided sample rate is [Sample rate]
- The [Core name] core's base width is [Base width]
- The [Core name] core's base height is [Base height]
- The [Core name] core's max width is [Max width]
- The [Core name] core's max height is [Max height]
- The [Core name] core's core provided aspect ratio is [Aspect ratio]

## Usage

// Explain how to use the core if further explanation is needed

## Core options

The [Core name] core has the following option(s) that can be tweaked from the
core options menu. The default setting is shown in **boldface**.

// Fill in the [Core name]

Settings with (Restart) means that core has to be closed for the new setting to
be applied on next launch.

// Fill in core options.
// Add core option screenshots if needed.

- **Core Option** [option-string] (**Setting1**|Setting2)

	Awaiting description.

Core Option - Setting

## User # - # device types

The [Core name] core supports the following device type(s) in the controls menu,
bolded device types are the default for the specified user(s):

// Add [Core name] and device types
/// Possible device types
/// Gamepad
/// Analog
/// Keyboard
/// Mouse
/// Lightgun
/// Pointer

- None - Optional description.
- **(Device name)** - (Device type) - Optional description.

## Other devices

// This section is for cores that have devices that cannot be manually selected

- (Device name) - (Device type) - Optional description.

## Rumble

- // This section is for cores that have rumble support
- // Explain how to activate rumble

Rumble only works in the [Core name] core when

- // Fill in the [Core name]

- The content being ran has rumble support.
- The frontend being used has rumble support.
- The controller device being used has rumble support.

## Multitap

- // This section for cores that have an option to activate mutlitap in
  supported games. Explain how to activate multitap.

## Gamepad

- // Add RetroPad inputs, please note the third column is only used when an
  input doesn't have a descriptor.

{{ read_csv('core-template-input-gamepad.csv', colalign=('center','left','left'), comment='#') }}

## Keyboard

- // Add keyboard inputs

{{ read_csv('core-template-input-keyboard.csv', colalign=('right','left'), comment='#') }}

## Mouse

- // Add mouse inputs

{{ read_csv('core-template-input-mouse.csv', colalign=('center','left'), comment='#') }}

## Pointer

- // Add pointer inputs

| RetroPointer Inputs                                                                               | (Device name) Inputs      |
|:-------------------------------------------------------------------------------------------------:|:--------------------------|
| ![RetroMouse cursor][retromouse] or ![Touch pointer][gfinger-front]<br />Pointer Position         | -                         |
| ![RetroMouse left click][retromouse-lbutton] or ![Touch select][gfinger-tap]<br />Pointer Pressed | -                         |

## Lightgun

- // Add lightgun inputs
- /// Deprecated Lightgun inputs
- /// RETRO_DEVICE_ID_LIGHTGUN_CURSOR - Use Gun Aux A instead
- /// RETRO_DEVICE_ID_LIGHTGUN_TURBO - Use Gun Aux B instead
- /// RETRO_DEVICE_ID_LIGHTGUN_PAUSE - Use Gun Start instead

{{ read_csv('core-template-input-lightgun.csv', colalign=('center','left'), comment='#') }}

## Compatibility

- // Paste in a link to a compatibility list
- // Or write up a compatibility description
- // Or make a compatibility table

## External Links

- // Put relevant links here

- [Official/Original (Core name) Website](https://link)
- [Official/Original (Core name) (Website name) Repository](https://link)
- [Libretro (Core name) Core info file](https://link)
- [Libretro (Core name) (Website name) Repository](https://link)
- [Report Libretro (Core name) Core Issues Here](https://link)

## (Related cores)

- // Add links to related core docs here. Use the See Also doc for help
- // https://docs.libretro.com/meta/see_also

[bios]: ../library/bios.md
  "Verifying that you have the right BIOS - Libretro Documentation"
[core-license-file]: #
[database-file]: #
[gfinger-front]: ../image/Button_Pack/Gestures/Gesture_Finger_Front.png
  "RetroInput touch screen input"
[gfinger-tap]: ../image/Button_Pack/Gestures/Gesture_Tap.png
  "RetroInput touch interface selection"
[ra-licensing]: ../development/licenses.md
  "Licenses - Libretro Documentation"
[retromouse]: ../image/retromouse/retro_mouse.png
  "RetroMouse"
[retromouse-lbutton]: ../image/retromouse/retro_left.png
  "RetroMouse Left button"
[retromouse-mbutton]: ../image/retromouse/retro_middle.png
  "RetroMouse Middle button"
[retromouse-rbutton]: ../image/retromouse/retro_right.png
  "RetroMouse Right button"
[retropad-a]: ../image/retropad/retro_a.png
  "RetroPad A button"
[retropad-b]: ../image/retropad/retro_b.png
  "RetroPad B button"
[retropad-dpad-down]: ../image/retropad/retro_dpad_down.png
  "RetroPad Directional-pad Down"
[retropad-dpad-left]: ../image/retropad/retro_dpad_left.png
  "RetroPad Directional-pad Left"
[retropad-dpad-right]: ../image/retropad/retro_dpad_right.png
  "RetroPad Directional-pad Right"
[retropad-dpad-up]: ../image/retropad/retro_dpad_up.png
  "RetroPad Directional-pad Up"
[retropad-l1]: ../image/retropad/retro_l1.png
  "RetroPad L1 left shoulder button"
[retropad-l2]: ../image/retropad/retro_l2.png
  "RetroPad L2 left analog trigger"
[retropad-l3]: ../image/retropad/retro_l3.png
  "RetroPad L3 left analog stick button"
[retropad-lstick]: ../image/retropad/retro_left_stick.png
  "RetroPad left analog stick"
[retropad-r1]: ../image/retropad/retro_r1.png
  "RetroPad R1 right shoulder button"
[retropad-r2]: ../image/retropad/retro_r2.png
  "RetroPad R2 right analog trigger"
[retropad-r3]: ../image/retropad/retro_r3.png
  "RetroPad R3 right analog stick button"
[retropad-rstick]: ../image/retropad/retro_right_stick.png
  "RetroPad right analog stick"
[retropad-select]: ../image/retropad/retro_select.png
  "RetroPad Select button"
[retropad-start]: ../image/retropad/retro_start.png
  "RetroPad Start button"
[retropad-x]: ../image/retropad/retro_x.png
  "RetroPad X button"
[retropad-y]: ../image/retropad/retro_y.png
  "RetroPad Y button"
[softpatching]: ../guides/softpatching.md
  "Softpatching ROMs with RetroArch - Libretro Documentation"
