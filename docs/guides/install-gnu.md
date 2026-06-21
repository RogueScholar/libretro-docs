---
title: RetroArch on GNU/Linux
description: Instructions for setting up RetroArch on Linux systems
---

# Installing RetroArch on Linux

This page contains descriptions of several officially-supported methods of
installing RetroArch on systems running the GNU/Linux kernel.

<iframe allow="accelerometer 'self'; clipboard-write *; display-capture 'self'; encrypted-media 'src';
  fullscreen *; geolocation 'src'; gyroscope 'self'; hid 'self'; picture-in-picture *; screen-wake-lock *;
  web-share *;" aria-label="YouTube video" height="315" width="560" loading="lazy" role="application"
  name="YouTube embedded player" title="RetroArch - How to Install: Linux" referrerpolicy="strict-origin-when-cross-origin"
  sandbox="allow-orientation-lock allow-popups allow-presentation allow-same-origin allow-scripts"
  src="https://www.youtube-nocookie.com/embed/7ZSPR2eYULU?origin=docs.libretro.com&playsinline=1"
  style="border-collapse: collapse; border-style: hidden; display: block; margin: 1.5rem auto 2rem; position: relative;"></iframe>

---

## Flatpak (suitable for most Linux distributions)

Flatpaks are a distribution-agnostic package format with broad support for
computers running Linux or some other Unix-like operating system. An [**official
RetroArch flatpak**][retroarch-flatpak] is produced by the Libretro Team and
published in Flathub, the offical app store that comes preconfigured with the
`flatpak` command. Follow the three easy steps below to install RetroArch as a
Flatpak.

### Installation

1. Ensure that you already have your distribution's Flatpak package installed
   ([setup guide][flatpak-setup]) by running `flatpak --installations` in your
   terminal and seeing that no errors are shown.

1. Confirm that Flathub is already configured as a Flatpak remote (a.k.a.
   trusted source). You can see a list of your current Flatpak remotes with the
   [`flatpak remotes`][flatpak-remotes] command (shown with desired output).

    ??? example "Desired output of `flatpak remotes`"

        ``` shell-session hl_lines="4"
        ra@libretro:~$ flatpak remotes --columns=name:f,url:f,homepage:f

        Name    URL                          Homepage
        flathub https://dl.flathub.org/repo/ https://flathub.org/
        ```

    If Flathub is not among the listed entries, expand the box below to see the
    options needed for the [`flatpak remote-add`][flatpak-remote-add] command to
    configure it.

    ??? info "Use `flatpak remote-add` to configure Flathub as a new remote"

        ``` shell
        sudo flatpak remote-add --if-not-exists flathub \
          https://flathub.org/repo/flathub.flatpakrepo
        ```

1. Lastly, use the [`flatpak install`][flatpak-install] command with the options
   shown below to download and install the latest version from Flathub. You have
   the option to make it available only to the active user, or perform a
   "system" installation that can be used by all users.

    Active user only:

    ``` shell
    flatpak install -y --or-update --user --from \
      https://dl.flathub.org/repo/appstream/org.libretro.RetroArch.flatpakref
    ```

    All users (system installation):

    ``` shell
    sudo flatpak install -y --or-update --system --from \
      https://dl.flathub.org/repo/appstream/org.libretro.RetroArch.flatpakref
    ```

### Launching the RetroArch flatpak

RetroArch should now be listed alongside your other installed software in the
app launcher you have setup; try launching it from there first. If you're
still in the terminal, you can use [`flatpak run`][flatpak-run] to launch it
from there—just add the RetroArch Flathub ID, `org.libretro.RetroArch`, at the
end.

``` shell
flatpak run org.libretro.RetroArch
```

### Updates

RetroArch updates should occur regularly according to the schedule set in your
system's package manager, but you can also update RetroArch by itself at any
time by using the [`flatpak update`][flatpak-update] command you see below.

``` shell
flatpak update -y --app org.libretro.RetroArch
```

## Ubuntu(-based)

### Official Ubuntu package

Ubuntu provides RetroArch as a native ["deb" package][ubuntu-package] in the
Universe section of their software repository. Packages in that section are
maintained by community volunteers, are supported only by other users, and do
not have a regular update schedule. Nevertheless, for new or casual users of
Ubuntu or a derivative, this is certainly the fastest and easiest method for
installing RetroArch. To begin, you can either open the built-in package manager
application, [_App Center_][ubuntu-app-center] then search for "RetroArch"
and click the Install button, or execute this single command in the terminal:

``` shell
sudo apt --upgrade --yes install retroarch
```

### Personal Package Archives (PPAs)

In an effort to improve the experience of RetroArch users on Ubuntu, official
[Ubuntu flavors][ubuntu-flavors], and all of the many other Linux distributions
based on Ubuntu (such as Linux Mint, Zorin OS, Pop! OS, elementary OS, etc.),
the Libretro Team has been producing its own Debian packages as an alternative
to the ones supplied by Ubuntu in the "universe" archive since July 2014.

These packages are updated nightly to include new features/bug fixes as soon as
they are added to the codebase, and compiled with a number of optional features
that the official Ubuntu package intentionally disables. Likewise, we produce
individual packages for the vast majority of popular Libretro cores. Cores
installed this way are instantly available to all users of a system, unlike
those from the Online Updater inside RetroArch which must be stored in the
active user's home directory, and are then updated by the package manager along
with the rest of your installed packages.

Everything we just described is built and distributed on the [Launchpad
platform][launchpad-team] operated by Canonical (the company behind Ubuntu),
available in two channels, called Personal Package Archives (PPAs), that target
two distinct types of user. By simply [enabling one (or both) of
them][help-ppas], users can seamlessly replace the RetroArch package from Ubuntu
with these direct from the Libretro Team. The two available PPAs are:

- [**Stable**][ppa-stable] (recommended) — includes only official RetroArch
  releases (as announced on libretro.com / retroarch.com), but no packaged
  Libretro cores ([use the Online Updater](download-cores.md) instead)

- [**Testing**][ppa-testing] — contains packages for RetroArch and most
  Libretro cores built from the latest source code, for testing new bug fixes
  and features as soon as they're added

### Installation

Follow these steps to enable the Libretro PPAs on your Ubuntu(-based) system.

1. In order to add PPAs to your system's configured package sources, some
   tools from the `software-properties-common` package are needed. Run the
   command below to ensure that you already have them, or install them, if not.

    ``` shell
    sudo apt --update --yes install software-properties-common
    ```

1. Once that's done, only a single additional terminal command is needed to
   add one of the PPAs to your system's package sources; select the one best
   suited to your needs, or both, if you like.

    - To add the [**Stable PPA**][ppa-stable], run this command:

        ``` shell
        sudo add-apt-repository --yes --no-update --ppa libretro/stable
        ```

    - Or to add the [**Testing PPA**][ppa-testing]:

        ``` shell
        sudo add-apt-repository --yes --no-update --ppa libretro/testing
        ```

1. You can now install the RetroArch package from the PPAs with this command:

    ``` shell
    sudo apt --update --yes install retroarch
    ```

#### Verifying PPA package installation

You can verify that you've successfully switched to the RetroArch package from
one of the PPAs with the command `apt show retroarch`.

!!! tip "What to look for"
    Look at the **`APT-Sources:`** line in the output. If one of the PPA
    packages is installed, its value will begin with
    ==https​://ppa.launchpadcontent.net/libretro/==.

??? example "Sample `apt show` output for the Testing PPA package"

    ``` shell-session hl_lines="14"
    ra@libretro:~$ apt show retroarch
    Package: retroarch
    Version: {{ unit.stable }}+ds1+r202602131849~4c3793f36c-216~ubuntu26.04.1
    Priority: optional
    Section: games
    Maintainer: Libretro Team <libretro@gmail.com>
    Original-Maintainer: Debian Games Team <pkg-games-devel@lists.alioth.debian.org>
    Installed-Size: 25.4 MB
    Provides: libretro-frontend, retroarch-dbg
    Depends: fonts-dejavu-core, libdecor-0-0 (>= 0.2.0), […]
    Recommends: retroarch-assets (>= 1.19.0), retroarch-data […]
    Suggests: libgamemode0 (>= 1.6.1), xdg-utils
    Download-Size: 7,422 kB
    APT-Sources: https://ppa.launchpadcontent.net/libretro/testing/ubuntu […]
    Description: frontend for libretro API-compatible applications
     RetroArch is an open source, multi-platform frontend for emulators and
     standalone games that are compatible with the libretro API, which it refers to
     as "cores." Depending on the available cores, RetroArch can be used as a
     modular multi-emulator system, game engine, media player or merely a 3-D
     technical demonstration.
     .
     […]

    Notice: There is 1 additional record. Please use the '-a' switch to see it
    ```

### Updates

With this installation method, RetroArch updates happen automatically along
with your system's regular package upgrades. However, you are always able to
trigger an update specifically for RetroArch (if one is available) with the
terminal command:

``` shell
sudo apt --update --yes upgrade retroarch
```

## Arch Linux(-based)

### Installation

#### Official Arch package

Arch Linux provides a [**retroarch**][arch-retroarch] package for x86_64 systems
in their official [Extra repository][archwiki-extra-repo]. You can install it by
searching for RetroArch by name in a graphical package manager (like
[Octopi][octopi]), or from the terminal with the command:

``` shell
sudo pacman -S retroarch
```

Arch opts to package the graphical assets for most of the RetroArch interfaces
separately (only the [RGUI interace][rgui] fonts and wallpapers are included
with RetroArch) in an effort to keep package sizes at a minimum and give users
the ability to install only what they themselves need. Depending on which
interface(s) you like to use, these other packages from the Extra repository may
also need to be installed:

- [retroarch-assets-glui][arch-glui-assets] – icons for the
  [GLUI interface][glui] for touch-enabled displays (formerly MaterialUI)
- [retroarch-assets-ozone][arch-ozone-assets] – fonts and icons for the Nintendo
  Switch™-inspired [Ozone interface][ozone] (default since version 1.7.6)
- [retroarch-assets-xmb][arch-xmb-assets] – fonts, icons and themes for the Sony
  PS3™-inspired [XMB interface][xmb] (default prior to version 1.7.6)

#### Arch User Repository (AUR) package

Another RetroArch package is available in the [Arch User Repository][arch-aur]
(AUR), named [**retroarch-git**][aur-retroarch], built from the currently
available source code (similar to the [Testing PPA][anchor-testing-ppa] for
Ubuntu described above). To install packages from the AUR, you first need to
have an "[AUR helper][archwiki-aur-helpers]" installed ([`yay`][yay] is a
popular choice). Once that's done, RetroArch can be installed from the AUR using
Octopi or another graphical package manager, or from the terminal using your AUR
helper (example: `yay retroarch-git`).

??? tip "Installing an AUR helper"
    If you wish to install the AUR package but don't yet have an AUR helper
    installed on your system, the following terminal command will download the
    `yay` source code, compile it and install the command on your system to use:

    ``` shell
    pacman -S --needed git base-devel &&
      git clone https://aur.archlinux.org/yay-bin.git &&
        cd yay-bin && makepkg -si
    ```

The AUR also contains a number of other packages that provide more frequent
updates for various RetroArch components. One notable example is the
[libretro-meta][aur-meta] package which installs the retroarch-git package
mentioned above along with 32 popular Libretro core packages, the Steam launcher
and several menu themes. Other AUR packages that you may wish to consider
installing include:

- [gamemode-git][aur-gamemode] – system performance enhancement for gameplay
- [libretro-database-git][aur-database] – updates for cheat codes, content data
  files, game compatibility lists, search metadata, etc.
- [libretro-shaders-slang-git][aur-shaders] – updated [shaders] (graphical
  filters that enhance the appearance of retro graphics for modern displays)
- [retroarch-assets-git][aur-assets] – updated interface fonts, icons, overlays,
  wallpapers, etc.
- [retroarch-joypad-autoconfig-git][aur-autoconfig] – updated configuration
  files for game controllers and other input devices

### Updates

With this installation method, RetroArch updates will automatically be included
with your system's regular package upgrades. However, you are always able to
trigger an update specifically for RetroArch (if one is available) with the
following commands.

- Official package

    ``` shell
    pacman -Syyuu retroarch
    ```

- AUR package

    ``` shell
    yay -Syyuu retroarch-git
    ```

[anchor-testing-ppa]: #personal-package-archives-ppas
  "Jump to section: Personal Package Archives (PPAs)"
[arch-aur]: https://aur.archlinux.org/
  "Arch User Repository (AUR)"
[arch-glui-assets]: https://archlinux.org/packages/extra/any/retroarch-assets-glui/
  "Arch Linux - retroarch-assets-glui (any)"
[arch-ozone-assets]: https://archlinux.org/packages/extra/any/retroarch-assets-ozone/
  "Arch Linux - retroarch-assets-ozone (any)"
[arch-retroarch]: https://archlinux.org/packages/extra/x86_64/retroarch/
  "Arch Linux - retroarch {{ unit.stable }}-1 (x86_64)"
[arch-xmb-assets]: https://archlinux.org/packages/extra/any/retroarch-assets-xmb/
  "Arch Linux - retroarch-assets-xmb (any)"
[archwiki-aur-helpers]: https://wiki.archlinux.org/title/AUR_helpers
  "AUR helpers - ArchWiki"
[archwiki-extra-repo]: https://wiki.archlinux.org/title/Official_repositories#extra
  "Official repositories - ArchWiki"
[aur-autoconfig]: https://aur.archlinux.org/packages/retroarch-joypad-autoconfig-git
  "AUR - retroarch-joypad-autoconfig-git"
[aur-database]: https://aur.archlinux.org/packages/libretro-database-git
  "AUR - libretro-database-git"
[aur-gamemode]: https://aur.archlinux.org/packages/gamemode-git
  "AUR - gamemode-git"
[aur-meta]: https://aur.archlinux.org/packages/libretro-meta
  "AUR - libretro-meta"
[aur-retroarch]: https://aur.archlinux.org/packages/retroarch-git
  "AUR - retroarch-git"
[aur-shaders]: https://aur.archlinux.org/packages/libretro-shaders-slang-git
  "AUR - libretro-shaders-slang-git"
[flatpak-install]: https://docs.flatpak.org/latest/flatpak-command-reference.html#flatpak-install
  "Flatpak Command Reference: flatpak-install — Install an application or runtime"
[flatpak-remote-add]: https://docs.flatpak.org/latest/flatpak-command-reference.html#flatpak-remote-add
  "Flatpak Command Reference: flatpak-remote-add — Add a remote repository"
[flatpak-remotes]: https://docs.flatpak.org/latest/flatpak-command-reference.html#flatpak-remotes
  "Flatpak Command Reference: flatpak-remotes — List remote repositories"
[flatpak-run]: https://docs.flatpak.org/latest/flatpak-command-reference.html#flatpak-run
  "Flatpak Command Reference: flatpak-run — Run an application or open a shell in a runtime"
[flatpak-setup]: https://flatpak.org/setup/
  "Flatpak—the future of application distribution"
[flatpak-update]: https://docs.flatpak.org/latest/flatpak-command-reference.html#flatpak-update
  "Flatpak Command Reference: flatpak-update — Update an application or runtime"
[glui]: glui.md
  "GLUI Interface - Libretro Documentation"
[launchpad-team]: https://launchpad.net/~libretro
  "Libretro team - Launchpad"
[octopi]: https://tintaescura.com/projects/octopi/
  "Octopi - Tinta escura"
[ppa-stable]: https://launchpad.net/~libretro/+archive/ubuntu/stable
  "Libretro Stable : “Libretro” team (Launchpad)"
[ppa-testing]: https://launchpad.net/~libretro/+archive/ubuntu/testing
  "Libretro Testing/Nightly : “Libretro” team (Launchpad)"
[ozone]: ozone.md
  "Ozone Interface - Libretro Documentation"
[retroarch-flatpak]: https://flathub.org/apps/org.libretro.RetroArch
  "Install RetroArch on Linux | Flathub"
[rgui]: rgui.md
  "RGUI Interface - Libretro Documentation"
[shaders]: ../shader/introduction.md
  "Introducing shaders - Libretro Documentation"
[ubuntu-app-center]: https://ubuntu.com/desktop/docs/en/latest/how-to/software/install-an-application/
  "Install an application - Ubuntu Desktop documentation"
[ubuntu-flavors]: https://ubuntu.com/desktop/flavors
  "Ubuntu flavors | Ubuntu"
[ubuntu-package]: https://packages.ubuntu.com/search?keywords=retroarch&searchon=names
  "Ubuntu – Package Search Results -- retroarch"
[ubuntu-ppas]: https://ubuntu.com/desktop/docs/en/latest/how-to/software/add-a-software-repository/
  "Add a software repository - Ubuntu Desktop documentation"
[xmb]: xmb.md
  "XMB Interface - Libretro Documentation"
[yay]: https://github.com/Jguer/yay
  "Jguer/yay: Yet another Yogurt - An AUR Helper written in Go (GitHub)"
