# iOS Compilation / Development Guide

The following is a non-developer guide to install RetroArch on non-jailbroken
iOS or tvOS devices.

The minimum version of iOS supported is v6.0. However, older versions have fewer
features and worse core support.

!!! note
    If you just want to sideload from an IPA file, then you can find a working
    build (version {{ unit.stable }}) [here for tvOS][ipa-tvos] and
    [here for iOS][ipa-ios]. Instructions for installing the IPA are
    [here][ios-installation].

Because iOS requires that all code be signed, iOS does not support
installing/updating cores at runtime. Instead, all cores must be built and added
to the RetroArch source tree before building RetroArch.

## Environment configuration

The following software needs to be installed:

- [Xcode][appstore-xcode] (macOS only)

### Sign in with your Apple ID

1. Open Xcode Preferences (Xcode -> Preferences)
1. Click the "Accounts" tab
1. Hit the "+" at the bottom left and choose "Apple ID" and sign in with your
   Apple ID
1. Once you’ve successfully logged in, a new team called "(Your Name) Personal
   Team" with the role "User" will appear beneath your Apple ID.

### Pair Xcode with your iOS or tvOS Device

Connect your iPhone to your computer. For AppleTV, because you cannot connect it
directly, follow [these instructions][xcode-appletv-pairing] from Apple support
to pair your device in Xcode. When finished, you should see your specific device
when you go, in Xcode, to Windows -> Devices & Simulators.

## Fetching the code

### libretro-super

The easiest way to fetch the source code for RetroArch and all the cores is to
use libretro-super. Open Terminal (it's in `/Applications/Utilities`) and run
the following commands:

```sh
git clone https://github.com/libretro/libretro-super.git libretro-super && cd libretro-super
```

You can run the following command from the cloned repository root to download
the source for RetroArch as well as all of the cores:

```sh
./libretro-fetch.sh
```

Alternatively, to download the source for RetroArch only use:

```sh
./libretro-fetch.sh --retroarch
```

Or specify just the cores that you want:

```sh
./libretro-fetch.sh snes9x2010 fceumm
```

### RetroArch repository

If you choose not to use libretro-super, you can clone RetroArch's repository
from [GitHub][retroarch-repo].

```sh
git clone https://github.com/libretro/RetroArch.git retroarch && cd retroarch
```

For subsequent builds you only need to pull the changes that were committed
since you cloned the repository using the `git pull` command.

## Cores

Emulator cores are needed to use RetroArch as they contain the code that drives
the emulation of the system of the game you want to play. All of the cores
should have the extension `.dylib` and be placed in the RetroArch source tree in
the directory `pkg/apple/iOS/modules` (`pkg/apple/tvOS/modules` for tvOS).

### Downloading Pre-built Cores

Pre-built cores are available from the buildbot for [iOS][buildbot-ios] and
[tvOS][buildbot-tvos]. You can also use the update-cores.sh script in the
RetroArch source tree to fetch the cores from the buildbot for you with:

```sh
./pkg/apple/update-cores.sh [--tvos] [core name]…
```

Without any arguments, it will try to update all of the cores in
`pkg/apple/iOS/modules`. If there are no cores already downloaded, it will list
the cores that are available to download. Any arguments are treated as core
names and it will try to download that core if it is not already available.

### Building Cores

Instead of downloading pre-built cores, you can build the cores yourself. The
easiest way to build all the cores is to use libretro-super.

The commands to build the cores for the supported iOS versions are as follows:

- **iOS 11 and up:**

  ```sh
  ./libretro-build-ios-arm64.sh
  ```

- **iOS 9 and iOS 10:**

  ```sh
  ./libretro-build-ios9.sh
  ```

- **iOS 6 to iOS 8:**

  ```sh
  ./libretro-build-ios.sh
  ```

In case you only want to build one and/or more cores instead of all, you can
specify the cores you want to build after the first command in no particular
order. For example:

```sh
./libretro-build-ios-arm64.sh snes9x2010 fceumm
```

Once finished, you can find the libretro cores inside the `dist/ios-arm64`,
`dist/ios9` or `dist/ios` directory, depending on which build script you ran.

### Code Signing the Cores

Note that you *must code sign the dylib cores* in order for you to use them.

#### iOS 9 and above

Starting from iOS 9, an additional security measure introduced requiring the
cores to be packaged as part of the application, even if they are code-signed.
Fortunately, the code signing is handled as part of the Xcode build/archive
process, so all you need to do is place your compiled `.dylib` cores in the
`pkg/apple/iOS/modules` folder. Running the application via Xcode or archiving
the application for an adhoc distribution will codesign the cores as long as
they are placed in the aforementioned folder.

#### iOS 6 to 8

You need to manually code sign the cores, and then you can copy them to the
`Documents/RetroArch/cores` directory using an application like "iFunBox" or
"iExplorer".

```sh
cd [path where the dylib cores are]
codesign -fs '[Your Full Developer Certificate Name]' *.dylib
```

## Building RetroArch

There are multiple Xcode project files in `pkg/apple`, based on minimum iOS
version. The following will use `pkg/apple/RetroArch_iOS13.xcodeproj` (the
most recent as of this writing) as an example.

1. Open Xcode.
1. Open the following project file `pkg/apple/RetroArch_iOS13.xcodeproj`.
1. In the Navigator Pane on the left, select the `Retroarch_iOS13` project.
1. In the Project and Targets list on the left side, choose the `RetroArchiOS`
   (or `RetroArchTV` for tvOS) target. Select the Target (the one with the
   RetroArch icon), not the project.
1. In the `Signing & Capabilities` tab, change the "Team" under Signing to be
   your developer name.
1. Set the active scheme to `RetroArch iOS Release` (or `RetroArch tvOS Release`
   for tvOS), and select your connected iOS/tvOS device as the device.
1. Run (**&#8984;-R**)

![Xcode Steps][xcode-ios-install-pic]

Once the application has been built, installed, and run on your device, it can
be run again directly from the device without needing Xcode.

## Additional Tips

### Cores

When you run RetroArch and try to run a game, and see the message "Failed to
load libretro core", that means the core is not code signed. See the above
"[Code Signing the Cores][code-sign-cores]" section on making sure your cores
are signed. You can manually check the code signature on a file with the
command: `codesign -dvv mednafen_psx_libretro_ios.dylib`. The Authority entry
has your certificate—make sure it's your dev or adhoc distribution certificate.

To see if your core is valid and usable in RetroArch, you can also try Load Core
and selecting the core. If you see the core name appear at the top (in the GUI
menu), then it is properly code signed and loaded. If you still see "No Core",
then your core is not code signed and cannot be used.

### Top Shelf

Top Shelf for tvOS will display up to five entries from each of the History and
Favorites playlists, but is not compiled by default. The Top Shelf extension
runs in a different sandbox, and sharing the playlists requires the use of App
Groups. In order to enable the Top Shelf extension, follow these steps:

1. With the project selected, select the RetroArchTV target. In the `Signing &
   Capabilities` tab, add the `App Groups` capability, and provide a unique
   group identifier.
1. You will also need to provide a unique app/bundle identifier. This will have
   the effect of breaking updating from a prior version of the app, as the app
   data will not be copied over due to the new bundle identifier.
1. Select the RetroArchTopShelfExtension target. In the `Signing & Capabilities`
   tab, add the `App Groups` capability, and provide the same unique group
   identifier.
1. You will also need to provide a unique app/bundle identifier for the
   extension.
1. In `pkg/apple/RetroArchTopShelfExtension/ContentProvider.h`, change the value
   of `kRetroArchAppGroup` to be the same unique group identifier.

### Development

#### Where do I start?

The RetroArch codebase can be daunting, especially if you're used to iOS
development in Objective C or Swift. Objective C is a subset of C so the syntax
should look at least somewhat familiar.

The first and main entrypoint you should look at is in `core/griffin/griffin.c`.
This is where all the code is included, with compiler flags used to bring in
code specific to the platform. For iOS, you should pay attention to the compiler
flags like `__APPLE__`, `TARGET_OS_IPHONE`, `HAVE_COCOATOUCH`.

Note that you can <kbd>⌘</kbd> + left-click into the `#include` paths to peer
into the source code. You can also <kbd>⌘</kbd> + <kbd>⇧ Shift</kbd> +
<kbd>O</kbd> and type in the source file's name. And, breakpoints work as well!

The iOS specific code is in `core/griffin/griffin_objc.m`. Here you'll find the
include to `./ui/drivers/ui_cocoatouch.m`, which contains the application
delegate—the main entry point for the iOS application lifecycle. From there,
everything should look familiar to you as an iOS developer, and you should be
able to hook in any iOS-specific Objective C code. Although you can use
Objective C data structures and code, you'll probably be having to use C data
structures since you'll have to call methods in C to hook back into RetroArch,
and they will expect C data structures. The great thing is you can mix C code
with Objective C, as long as you do the necessary conversions to the data
structures that RetroArch expects.

[appstore-xcode]: https://apps.apple.com/us/app/xcode/id497799835
[buildbot-ios]: https://buildbot.libretro.com/nightly/apple/ios-arm64/latest/
[buildbot-tvos]: https://buildbot.libretro.com/nightly/apple/tvos-arm64/latest/
[code-sign-cores]: #code-signing-the-cores
[ios-installation]: ../../../guides/install-ios.md
[ipa-ios]: https://buildbot.libretro.com/stable/{{ unit.stable }}/apple/ios-arm64/RetroArch.ipa
[ipa-tvos]: http://buildbot.libretro.com/stable/{{ unit.stable }}/apple/tvos-arm64/RetroArchTV.ipa
[retroarch-repo]: https://github.com/libretro/RetroArch
[xcode-appletv-pairing]: https://support.apple.com/en-gb/HT208088
[xcode-ios-install-pic]: ../../../image/guides/ios-install-pic-1.webp
