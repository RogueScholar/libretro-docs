# Downloading, Installing and Updating RetroArch for Windows 7 and Later

<!--
  SPDX-FileCopyrightText: © 2018, Daniel De Matteis <libretro@gmail.com>
  SPDX-FileCopyrightText: © 2018, Joel Hansen <joellhansenn@gmail.com>
  SPDX-FileCopyrightText: © 2019, Mark W. Kidd <mark@stardart.net>
  SPDX-FileCopyrightText: © 2019–2022, Ömercan Kömür <fpscan@gmail.com>
  SPDX-FileCopyrightText: © 2020, Colin Crowley <sanaki@fuzzy-dice.net>
  SPDX-FileCopyrightText: © 2020, Winston Weinert <winston@ml1.net>
  SPDX-FileCopyrightText: © 2020, Panagiotis Georgiadis <pgeorgia@redhat.com>
  SPDX-FileCopyrightText: © 2021, Sascha Shaw <sascha.shaw@t-online.de>
  SPDX-FileCopyrightText: © 2022, Tony Peter Jansson <tony@pihaus.org>
  SPDX-FileCopyrightText: © 2022, Gouchi <gouchi@free.fr>
  SPDX-FileCopyrightText: © 2023, Eric Warmenhoven <eric@warmenhoven.org>
  SPDX-FileCopyrightText: © 2023, Dillon Regimbal <dillon@dillonr.com>
  SPDX-FileCopyrightText: © 2024, Abhishek Jethuri <abhishek.jethuri@gmail.com>
  SPDX-FileCopyrightText: © 2024–2026, Peter J. Mello <admin@petermello.net>

  SPDX-License-Identifier: MIT
-->
<iframe allow="accelerometer 'self'; clipboard-write *; display-capture 'self'; encrypted-media 'src';
  fullscreen *; geolocation 'src'; gyroscope 'self'; hid 'self'; picture-in-picture *; screen-wake-lock *;
  web-share *;" aria-label="YouTube video" height="315" width="560" loading="lazy" role="application"
  name="YouTube embedded player" title="" referrerpolicy="strict-origin-when-cross-origin"
  sandbox="allow-orientation-lock allow-popups allow-presentation allow-same-origin allow-scripts"
  src="https://www.youtube-nocookie.com/embed/hu-TW02bhhY?origin=docs.libretro.com&playsinline=1"
  style="border-collapse: collapse; border-style: hidden; display: block; margin: 1.5rem auto 2rem; position: relative;">
</iframe>

## Downloading

First, decide if you want to run a **stable release** or a **nightly build**.
Both options provide you with the current RetroArch release but differ most
noticeably in that stable releases are packaged inside of a self-extracting
installer, while the nightly builds are distributed as a simple archive file
that has to be extracted manually. Both instances are considered "portable"
installation, meaning that once in place, RetroArch is:

- Self-contained
- Not reliant on using user-scope locations to store its configuration files
- Easy to update simply by replacing the existing files

### Stable

The stable version is our first priority and the main distribution version.
Since it is the major release, it comes out periodically. Stable releases take
more time to develop, and new features only become available after the next
release event. For example: a version can provide specific features and themes,
then in the next version, those features and themes might be removed, improved
or modified. As can be inferred from the name "Stable," these installations have
fewer bugs because of the quality assurance testing performed prior to every new
release event.

To get started, visit our [**stable releases**][buildbot-windows-stable]
repository and then select your hardware architecture to see a list of the
current installation files.

### Nightly

This version contains the latest changes made to the source code on GitHub,
providing the ability to try out the latest enhancements and features as soon as
they are added. The potential trade-off is that it may not be as stable due to
not yet having undergone the testing that's done prior to new stable releases,
though our development process is structured to catch new bugs quickly and
rollback the offending changes as soon as they're identified.

To get started, visit our [**nightly builds**][buildbot-windows-nightly]
repository and select from one of the archive files there within the folder
named for your hardware architecture. For a new installation, choose either the
**`RetroArch.7z`** archive or the (**`RetroArch-20XX-XX-XX-setup.exe`**)
self-extracting installer.

## Installing

If you download an archive package whose file extension is **`.7z`**, extract it
in a folder that doesn't require administrator privileges, such as
*`C:\Users\Username\RetroArch`* or another similar location; avoid extracting it
to *`Program Files`* or your `Windows` folder as that is known to cause issues.

## Updating

You can update a nightly build installation simply by downloading the latest
**`20XX-XX-XX-RetroArch.7z`** package and overwriting your current
`RetroArch.exe` file with the one inside the package.

If you used the installer package, we recommend not changing the default
installation path, simply follow the installation steps as they're shown in the
wizard and success should follow swiftly. You can update the installer version
by downloading a new installer package and executing it as you did before.

!!! warning
    If you were running a stable release prior to version `1.4.0`, you will need
    to update the system libraries when you upgrade RetroArch. You can do so by
    downloading either the **`RetroArch.7z`** or **`redist.7z`** package from
    the appropriate download repository.

## Starting RetroArch

The first time RetroArch is launched, you will be greeted by the screen below.

![Screenshot](../image/retroarch/ozone/first_run.webp)

From there, you can launch content, change settings or start adding files to
your content library.

### Keyboard Controls

The RetroArch user interface design is optimized for gamepad navigation, but it
also features robust keyboard and mouse support; learn more about keyboard input
in the [**Input and Controls**](input-and-controls.md) guide.

### Gamepad Controls

![Screenshot](../image/retroarch/xmb/autoconf.avif)

XInput peripherals should work with RetroArch without prior configuration. If
the controller can be auto-configured, the on-screen display will inform you of
the auto-configuration event; we currently include auto-configuration profiles
for a large number of popular controllers. If your input device isn't
auto-configured, follow these steps:

1. Navigate to `Settings` --> `Input` --> `Input User 1 Binds`
1. Select **`User 1 Bind All`**
1. Press the buttons as directed on-screen

!!! tip
    If you have several different controller types, you may want to use the
    **`User 1 Save Autoconfig`** option and after it the **`User 1 Bind Default
    All`** option in order to achieve reliable hotplug functionality.

### Directory Configuration

Configuring the directories where your RetroArch data will be stored and
accessed from later is an important aspect to get the best experience possible.
To define your RetroArch directories, follow these steps:

1. Navigate to `Settings` --> `Directory`
1. Select the folder that stores the type of data you want to save somewhere
1. Traverse your filesystem using the RetroArch menu to enter the desired folder

You should always configure these directory paths:

- **System Directory** – for *system files*
- **Savefile Directory** – for *game save files*
- **Savestate Directory** – for *game state files*
- **Browser Directory** – for a convenient starting point to browse *your
  content files*

### Installing Cores

![Core updater](../image/retroarch/ozone/core_downloader.avif)

RetroArch requires cores to run any content. You can download cores directly
from within RetroArch's interface by navigating to `Online Updater` --> `Core
Downloader` in the menu and selecting the core you wish to install.

### Running Content

After you have installed one or more cores, you can run your content by
following these steps:

1. Navigate to `Load Content`.
1. Browse to the folder that contains the content you wish to run and select it.
   If you have more than one compatible core, you will be asked to select the
   one to use.

![Run content](../image/retroarch/ozone/run_content.avif)

!!! tip
    By default, loading content will trigger a content scan. If your content
    matches an entry in our databases, it will be added to a playlist for easy
    access. Every content file that is launched is also added to a history
    playlist that allows it to be loaded again quickly at any time.

## Glossary

Below is a list of terms to LibRetro, RetroArch or this page's content with an
accompanying definition.

- `frontend`: A program designed to execute content using libretro cores, such
  as Kodi's RetroPlayer, RetroArch, Phoenix, Minir, etc.
- `core`: A program that has been made compatible with the libretro API and can
  run inside a libretro frontend.
- `content`: Any game, image, video or audio file that is executed by a libretro
  core; in most cases content files are the extracted ROMs published for use by
  an emulated platform.
- `retropad`: Libretro’s input controller abstraction, the interface between the
  physical controller and the inputs understood by the core.
- `save files`: Reloadable representations of player progress within content run
  by a libretro core and specific to that content; they are usually transferable
  between platforms and emulators.
- `save states`: Snapshots of the active memory at a particular moment while a
  libretro core is executing content; they are not generally transferable
  between platforms and will not work on a different emulator than the one used
  to create them.
- `system files`: Additional files that may or may not be part of the ROMset
  needed to allow some content to run correctly, usually referred to by the BIOS
  term.
- `autoconf`: A configuration file that contains the correct button definitions
  for a particular input device, allowing it to be used by RetroArch without
  user configuration whenever connected.

[buildbot-windows-nightly]: https://buildbot.libretro.com/nightly/windows/
[buildbot-windows-stable]: https://buildbot.libretro.com/stable/{{ unit.stable }}/windows/
