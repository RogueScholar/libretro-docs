# Texas Instruments TI-83 (Numero)

![](../image/core/numero/preview.avif)

## Background

Numero is a libretro core for emulating the TI-83 family of graphing
calculators, based on the awesome Wabbitemu emulator. It allows you to play your
TI-83 games like never before: in fullscreen and using a gamepad! You can also
control it with a mouse or keyboard, or you can just use the virtual mouse for
pressing the calculator buttons.

The Numero core has been authored by

- Neil Barkhina

The Numero core is licensed under

- [GPLv2](https://github.com/nbarkhina/numero/blob/master/LICENSE)

[A summary of the licenses](../development/licenses.md) behind RetroArch and its
cores is available.

## BIOS

It is required to have one of the BIOS files below in the frontend's system
directory. The `ti83se.rom` file is the recommended BIOS, as that provides the
largest memory capacity.

| Filename       | Description          | md5sum                             |
|:--------------:|:--------------------:|:----------------------------------:|
| `ti83se.rom`   | TI-83 Silver Edition | `c6ff8204c5c81b7be34614dbbd690c8b` |
| `ti83plus.rom` | TI-83 Plus           | `8011181f810b5ec4e9d6a03f0e14257a` |
| `ti83.rom`     | TI-83                | `d4448d09bbfde687c04f9e3310e023ab` |

## Extensions

Content that can be loaded by the Numero core may have the following file
extensions:

- `.8xp`
- `.8xk`
- `.8xg`

## Features

Frontend-level settings or features that the Numero core respects:

| Feature                                         | Supported |
|-------------------------------------------------|:---------:|
| Restart                                         | ✔        |
| Saves                                           | ✔        |
| States                                          | ✔        |
| Rewind                                          | ✖        |
| Netplay                                         | ✖        |
| Core Options                                    | ✔        |
| [Memory Monitoring (achievements)][mem-monitor] | ✖        |
| RetroArch Cheats                                | ✖        |
| Native Cheats                                   | ✖        |
| Controls                                        | ✔        |
| Remapping                                       | ✔        |
| Multi-Mouse                                     | ✖        |
| Rumble                                          | ✖        |
| Sensors                                         | ✖        |
| Camera                                          | ✖        |
| Location                                        | ✖        |
| Subsystem                                       | ✖        |
| [Softpatching]                                  | ✖        |
| Disk Control                                    | ✖        |
| Username                                        | ✖        |
| Language                                        | ✖        |
| Crop Overscan                                   | ✖        |
| LEDs                                            | ✖        |

## Directories

The Numero core saves to/loads from the default frontend save directory.

**Frontend Save directory**

| File         | Description |
|:---------------------------------:|:----------------------------------------:|
| `tisavestateprogressti83se.sav`   | SE Progress Save                         |
| `tisavestateprogressti83plus.sav` | Plus Progress Save                       |
| `tisavestateprogressti83.sav`     | TI-83 Progress Save                      |
| `tisavestatetemp.sav`             | Temp file used during manual save states |

## Geometry and timing

- The Numero core provides **60 FPS**.
- The Numero core provides an audio sample rate of **0** (no audio output).
- The Numero core's base width is **640px**.
- The Numero core's max width is **640px**.
- The Numero core's base height is **480px**.
- The Numero core's max height is **480px**.
- The Numero core's provided aspect ratio is **3:4** (W:H).

## Usage

- The Emulator will save your progress every 10 seconds. This is done in the
  background, since the calculator doesn't really have any "long term storage,"
  everything was always just saved in RAM; when you select `Close Content` in
  RetroArch, that will also immediately save your progress. Every time you load
  the core, you will be returned to the state from the last time it was run.
- You can run the core _without any content_ by just selecting `Start Core`.
- There are two control input schemes, and both permit changing the virtual
  mouse speed in the core options:
  - `Joypad` _(default)_ – move the virtual mouse with the :material-gamepad:
    D-Pad and click using the :material-alpha-a-circle: button.
  - `Gaming Buttons` _(more suited for gaming)_ – move the virtual mouse with
    the left analog stick and click by pressing the :guides-gamepad-stick-r3:
    analog stick.
- Press :guides-gamepad-button-l2: to toggle between "Calculator View" and "Big
  Mode".
- The `Restart` command in the RetroArch menu will clear the entire active
  memory; _use caution_ when doing this because you will lose all your data.
  - This is useful sometimes, however, should the emulator become frozen for
    some reason.
- Installing apps:
  - You are likely to need to install some "loaders," such as Ion (`Ion.8xg`) or
    Mirage for most of the demanding apps; navigate to `Retroarch` --> `Load
    Content` to do so. After starting the core, you will see a message in the
    lower-left corner if it imported successfully. You then need to reload your
    content file by selecting `Close Content` followed by `Load Content` from
    the menu. You can now safely install the game you want to run inside of the
    loader (e.g., `Ztetris.8xp`).
  - This process can be repeated multiple times to load all of the apps you want
    to run, but be careful not to completely fill up the available memory.
- Save states will restore whatever the state was of the entire calculator,
  including all installed apps.
  - You can create as many save states as there are save slots available,
    however they will be named internally based on how you started the emulator,
    whether from a ROM or just the core itself with no content. Use them
    liberally, since you may need to wipe the memory as described above and try
    again should you encounter issues.
  - There will will be a common "In Progress" storage mechanism used when
    loading different save states.
- If you have trouble installing a game or other program:
  - Try moving things around between Memory and Archive, sometimes certain
    launchers require things to not be in the Archive area. The video below by
    LGR includes a discussion of this phenomenon among a lot more very useful
    information.

<iframe allow="accelerometer 'self'; clipboard-write *; display-capture 'self'; encrypted-media 'src';
  fullscreen *; geolocation 'src'; gyroscope 'self'; hid 'self'; picture-in-picture *; screen-wake-lock *;
  web-share *;" aria-label="YouTube video" height="315" width="560" loading="lazy" role="application"
  name="YouTube embedded player" title="Running Doom on a Calculator! TI-83 Plus Games Tutorial"
  referrerpolicy="strict-origin-when-cross-origin"
  sandbox="allow-orientation-lock allow-popups allow-presentation allow-same-origin allow-scripts"
  src="https://www.youtube-nocookie.com/embed/nduMTX86Zl0?origin=docs.libretro.com&playsinline=1"
  style="border-collapse: collapse; border-style: hidden; display: block; margin: 1.5rem auto 2rem; position: relative;">
</iframe>

## Core options

The Numero core has the following option that can be accessed from the `Core
Options` menu (default value shown in boldface).

- **Speed of virtual mouse** [`mouse_speed`] (**1x**|2x|3x|4x|5x)

## Input types

The Numero core supports the following device types in the controls menu; device
types shown in boldface are the default for the specified user(s):

- None – No effect, doesn't disable input.
- **RetroPad** – Joypad
- **Gaming Buttons** – Same as Joypad, but with alternate mappings optimized for
  playing games.

Regardless of the choice above, this core also supports using any available
mouse/touchscreen to press the calculator buttons.

### Joypad

| RetroPad Inputs                             | User 1 input descriptors |
|:-------------------------------------------:|:-------------------------|
| ![](../image/retropad/retro_b.png)          | Button `2ND`             |
| ![](../image/retropad/retro_y.png)          | Button `DOWN`            |
| ![](../image/retropad/retro_select.png)     | Button `ALPHA`           |
| ![](../image/retropad/retro_start.png)      | Button `ENTER`           |
| ![](../image/retropad/retro_dpad_up.png)    | Mouse Up                 |
| ![](../image/retropad/retro_dpad_down.png)  | Mouse Down               |
| ![](../image/retropad/retro_dpad_left.png)  | Mouse Left               |
| ![](../image/retropad/retro_dpad_right.png) | Mouse Right              |
| ![](../image/retropad/retro_a.png)          | Mouse Click              |
| ![](../image/retropad/retro_x.png)          | Button `UP`              |
| ![](../image/retropad/retro_l1.png)         | Button `LEFT`            |
| ![](../image/retropad/retro_r1.png)         | Button `RIGHT`           |
| ![](../image/retropad/retro_l2.png)         | Toggle "Big Mode"        |
| ![](../image/retropad/retro_r2.png)         | Mouse Click              |

## External Links

- [Official Numero Github Repository](https://github.com/nbarkhina/numero)
- [Libretro Numero Core info file](https://github.com/libretro/libretro-super/blob/master/dist/info/numero_libretro.info)
- [Report Numero Core Issues Here](https://github.com/nbarkhina/numero/issues)

[Softpatching]: ../guides/softpatching.md
[mem-monitor]: ../guides/memorymonitoring.md
