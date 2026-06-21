# Downloading, Installing and Updating RetroArch for macOS

<iframe allow="accelerometer; ambient-light-sensor; autoplay; clipboard-write;
  display-capture; encrypted-media; execution-while-out-of-viewport; fullscreen;
  geolocation; gyroscope; hid; magnetometer; picture-in-picture;
  screen-wake-lock; speaker-selection; web-share;" aria-label="YouTube video"
  height="315" loading="lazy" name="YouTube embedded player"
  referrerpolicy="strict-origin-when-cross-origin" role="application"
  sandbox="allow-orientation-lock; allow-presentation;"
  src="https://www.youtube-nocookie.com/embed/H2Fv29vMpcY"
  style="border-collapse: collapse; border-style: hidden; margin: 1rem auto;"
  title="LibRetro: RetroArch experience on M2!" width="560"></iframe>

## Downloading and installing

### Stable vs. nightly builds

Most users should use the stable build for the best experience. The nightly
build contains the latest changes to the source code containing the latest
enhancements and features that have been added but not yet tested and verified
to work properly. Thus, the nightly builds as a rule are not as reliable as the
stable releases.

### Metal vs. non-Metal builds

Most users should use the Metal builds, which have more features and are a
Universal binary. The non-Metal builds are x86_64-only and only include the
OpenGL graphics driver. However, the Metal builds minimum required macOS version
is 10.13, whereas the non-Metal build is compatible with macOS 10.9+.

It is possible to build RetroArch for older versions of macOS, though due to
resource constraints these are not provided. See the
[compilation instructions for macOS][compiling-osx] to build it yourself.

### DMG package download links

Download one of the .dmg files below.

- _Metal builds:_
  + [**Stable**][stable-metal]
  + [**Nightly**][nightly-metal]
- _Non-Metal builds:_
  + [**Stable**][stable-non-metal]
  + [**Nightly**][nightly-non-metal]

The install follows the standard process of opening the .dmg file and copying
RetroArch.app into the Applications folder.

## Updating

There are no automatic updates in RetroArch. When updating, simply download and
open the new .dmg file, and copy RetroArch.app into Applications. When prompted,
choose to overwrite the old version.

[compiling-osx]: ../development/retroarch/compilation/osx.md
[nightly-metal]: https://buildbot.libretro.com/nightly/apple/osx/universal/RetroArch_Metal.dmg
[nightly-non-metal]: https://buildbot.libretro.com/nightly/apple/osx/x86_64/RetroArch.dmg
[stable-metal]: https://buildbot.libretro.com/stable/{{ unit.stable }}/apple/osx/universal/RetroArch_Metal.dmg
[stable-non-metal]: https://buildbot.libretro.com/stable/{{ unit.stable }}/apple/osx/x86_64/RetroArch.dmg
