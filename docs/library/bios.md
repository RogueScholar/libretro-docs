---
title: BIOS Information&nbsp;Hub
description: >-2
  Basic requirements to successfully managing device firmware files for use with
  your Libretro frontend.
glightbox: false
# icon: fontawesome/solid/microchip
# status: stable
---
<!--
  SPDX-FileCopyrightText: © 2018, Alfredo Monclus <alfredomonclus@gmail.com>
  SPDX-FileCopyrightText: © 2019, Thomas Lorblanchès <zlika_ese@hotmail.com>
  SPDX-FileCopyrightText: © 2020, negativeExponent <negativeExponent@users.noreply.github.com>
  SPDX-FileCopyrightText: © 2020, Colin Crowley <sanaki@fuzzy-dice.net>
  SPDX-FileCopyrightText: © 2020, Winston Weinert <winston@ml1.net>
  SPDX-FileCopyrightText: © 2021, Ignacio Sanchez Gines <nacho@geardome.com>
  SPDX-FileCopyrightText: © 2022–2025, Ömercan Kömür <fpscan@gmail.com>
  SPDX-FileCopyrightText: © 2022, BarbuDreadMon <barbudreadmon@gmail.com>
  SPDX-FileCopyrightText: © 2022, Zoltan Balogh <balogh.zoltan.v@gmail.com>
  SPDX-FileCopyrightText: © 2022, Neil Barkhina <nbarkhina@gmail.com>
  SPDX-FileCopyrightText: © 2023, Gouchi <gouchi@free.fr>
  SPDX-FileCopyrightText: © 2024–2026, Peter J. Mello <admin@petermello.net>
  SPDX-FileCopyrightText: © 2024, LLeny <LLeny@users.noreply.github.com>
  SPDX-FileCopyrightText: © 2024, Rupert Carmichael <carmiker@users.noreply.gitlab.com>
  SPDX-FileCopyrightText: © 2025, Jesse Talavera <jesse@jesse.tg>
  SPDX-FileCopyrightText: © 2025, 宋文武 <iyzsong@member.fsf.org>
  SPDX-FileCopyrightText: © 2025, 刘皓 <whiteaxe@tuta.io>

  SPDX-License-Identifier: MIT
-->

# Using device firmware files

## Three basic requirements

There are three crucial elements to successfully integrating device firmware
files, such as those containing the original BIOS of emulated hardware, with the
playing of content by a Libretro frontend, and a failure to account for any of
them is likely to result in failure of the overall attempt to play the content.
They are:

1. Location (file path)
1. Filename (including extension)
1. Checksum (typically using the MD5 algorithm)

Below we will examine each of these in sufficient detail that you are able to
understand and satisfy them in order to use such firmware files with RetroArch
successfully.

### Location

> **TL;DR:** Ensure that you have placed the firmware file(s) in the correct
> location in your filesystem.

Simply put, the folder where the frontend's configuration specifies these files
should be stored—known as the **`system`** folder—must both exist in the
filesystem _and_ have the appropriate permissions so that a running RetroArch
instance is able to learn its contents and access anything that it recognizes.
Included in this requirement is often the need for the files to be placed in a
subfolder of that directory that is named for the Libretro core that will be
requesting access to them; most Libretro cores are only permitted to access
files stored within their specific subdirectory of the **`system`** folder for
security reasons.

Start by ascertaining what your configuration specifies as the **`system`**
folder, which in RetroArch is shown by navigating from the main menu to
`Settings` --> `Directory` --> `System/BIOS` . The path to the **`system`**
folder will be shown at the right of the screen/window.

Regarding the possible need for the firmware to be in a core-specific subfolder
of the **`system`** directory, that information is accessible by first loading
the core using the `Load Core` option on the main menu and then navigating to
`Information` --> `Core Information` and looking for the `Firmware:` line,
beneath which will be a line that begins with `Looking in: …` followed by the
specific filesystem path the firmware files must be stored in, including the
core-specific subdirectory, if any.

### Name

Verify that the file(s) have the same name and extension that appears in the
core info/docs page.

Remember that some operating systems are case sensitive.

### File Hash (md5sum)

Last, but probably the most important part of all, the hash of your BIOS should
match the one in the docs.

#### What is a hash?

A File Hash is a string of characters that uniquely identifies a file.

#### Why should I care?

If I rename `dog.jpg` to `bios.bin`, how would you know?

If the dump is not the version that the core needs, or if the file integrity is
compromised (i.e. corrupted), unexpected (read: **bad**) things can happen.

A file can become corrupted by errors in transmission, write errors during
move/copy operations, faulty storage media, software bugs, etc.

#### How do I check it?

You need two things, a piece of software that can generate a hash from your file
and a known valid file hash for the comparison. You will find the correct hash
in the corresponding core information page (links below).

As for the software, some operating systems have integrated tools accessible at
the command line that can do the job, but if you prefer a graphical interface,
look for something like Open-Hashtool, HashMyFiles, etc.

## Links to the core specific BIOS information

{{ read_csv('bios-core-links.csv', colalign=('left','left','center','left'), comment='#') }}
