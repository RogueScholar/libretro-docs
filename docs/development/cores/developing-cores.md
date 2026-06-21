---
title: 'Libretro Core Development: An Overview'
description: A primer to the process of adapting emulation engines for the Libretro API.
icon: material/api
status: evolving
---

# Developing Libretro Cores

## The Libretro API

The Libretro API is a lightweight C-based Application Programming Interface
(API) that exposes generic audio, video, and input callbacks. Developers of
Libretro cores that implement such things as standalone games, game emulators,
media players, and other applications need not worry about writing different
video drivers for Direct3D or OpenGL, or feel burdened by catering to all
possible input and audio APIs, gamepad drivers, etc.

When you choose to use the libretro API, your program gets turned into a single
library file (a ‘libretro core’). Once the core is created, any frontend that
supports the Libretro API can then load that library file and run the app. The
frontend’s responsibility is to provide all the implementation-specific details.
The libretro core’s responsibility is solely to provide the main program.

Any project that is ported to work with this API can be made to run on ANY
libretro frontend – now and forever. You maintain a single codebase that only
deals with the main program, and you then target one single API (libretro) in
order to port your program over to multiple platforms at once. A libretro core
written in portable C or C++ can run seamlessly on many platforms with very
little porting effort, or sometimes none at all. Libretro bindings for other
languages are growing increasingly common and comprehensive, as well.

!!! info "Licensing"
    Libretro is an open specification that is completely free to implement, with
    no licensing fees or any other strings attached. Our reference frontend is
    RetroArch. The two projects are not the same, a fact reflected in their
    licensing. RetroArch is released under [GPL-3.0-or-later], whereas the
    Libretro API is distributed under the terms of the [MIT License][MIT].

## Resources for core development

### Canonical `libretro.h`

The [most current canonical copy of `libretro.h`][libretro.h] can be found in
the master branch of the [`libretro-common` repository][libretro-common-repo].

!!! tip
    `libretro.h` is the single most important technical reference for developers
    of Libretro cores and frontends.

### `skeletor` sample core

RetroArch contributor **bparker06** created [`skeletor`][skeletor] as a minimal
libretro core implementation. `skeletor` can also be useful by furnishing the
stub libretro `Makefile` and `Makefile.common` files.

### `libretro-common`

[`libretro-common`][libretro-common-repo] is a collection of essential
cross-platform coding blocks useful for Libretro core and frontend development,
written primarily in C and permissively licensed.

### `libretro-deps`

[`libretro-deps`][libretro-deps-repo] is a collection of third-party
dependencies that have been modified for use by Libretro cores.

### `libretro-samples`

[`libretro-samples`][libretro-samples-repo] is a set of illustrations of the
libretro API structure.

### Development logs of Libretro cores

Thanks to our amazing contributors, we are able to share these blog posts:

- [**Beardypig**][github-beardypig] published a two-part guide
  ([Part 1][beardypig-pt1], [Part 2][beardypig-pt2]) describing the process of
  implementing `libretro.h` as part of creating [Vectrexia][vectrexia], an
  original emulator core designed for Libretro from the ground up.
- [**James Roeder**][james-roeder] has written a seven-part series of blog posts
  entitled "An Arduous Endeavor" ([1: Background][arduvor-pt1],
  [2: Display][arduvor-pt2], [3: CPU][arduvor-pt3], [4: Input][arduvor-pt4],
  [5: Buzzes & Beeps][arduvor-pt5], [6: Save States & Rewind][arduvor-pt6],
  [7: Automated Builds][arduvor-pt7]).
- [**Natesh**][natesh-devblog] wrote a blog post about porting
  [GameboyCore into a Libretro core][natesh-gameboycore].

### OpenGL hardware-accelerated cores

A guide for [developing OpenGL-accelerated Libretro cores][opengl-cores] is
also available.

## Implementing the API

The libretro API consists of several functions outlined in
[`libretro.h`][libretro.h], available in the RetroArch
[source package][retroarch-source]. A Libretro implementation should be compiled
into a dynamically loadable executable (`.dll`/`.so`/`.dylib`) or a static
library (`.a`/`.lib`) that exports all the functions outlined in libretro.h;
these will be called by the frontend. Implementations are designed to be
single-instance, so global state is allowed, and should the frontend call these
functions in the wrong order, undefined behavior occurs. The API header is
compatible with C99 and C++; from C99, the `bool` type and `<stdint.h>` are
used.

The program flow of a frontend using the Libretro API can be expressed as a
serial progression through the stages listed below.

### Startup

#### `retro_api_version()`

This function should return RETRO_API_VERSION, defined in
[libretro.h][libretro.h]. It is used by the frontend to determine if ABI/API are
mismatched. The version will be bumped should there be any non-compatible
changes to the API. Changes to `retro_*` structures, as well as changes in
publicly visible functions and/or their arguments will warrant a bump in API
version.

#### `retro_set_*()`

Libretro is callback-based, so the frontend will set all callbacks at this
stage, and the implementation must store these function pointers somewhere. The
frontend can call these during later stages.

#### `retro_init()`

This function is called once to signal that the implementation should initialize
any needed data structures.

### Environment callback

While Libretro has callbacks for video, audio and input, still another callback
type exists known as the environment callback (`retro_environment_t`). This is a
generic way for the Libretro implementation to access features of the API that
are considered too obscure to deserve their own symbols, and which can be
extended without breaking the ABI. The callback has a return type of `bool`,
which reports whether the frontend recognized the request made of it.

#### `retro_set_controller_port_device()`

By default, gamepads will be assumed to be inserted into the implementation. If
the engine is sensitive to which type of input device is plugged in, the
frontend may call this function to set the device to be used for a certain
player. The implementation should try to auto-detect this, if possible.

#### `retro_get_system_info()`

Here the frontend will typically request statically known information about the
core, such as the name of the implementation, its version number, etc. The
information returned must be allocated statically.

#### `retro_load_game()`

This function loads content. If the implementation is an emulator, this would be
a game ROM image, or if it is a game engine this could be packaged assets for
the game, etc. The function takes a structure that points to the path where the
ROM was loaded from, as well as a memory chunk of the already loaded file.

**There are two modes of loading files with libretro.** If the game engine needs
to be aware of the path from which the content was loaded, the `need_fullpath`
field in `retro_system_info` must be set to `true`, in which case the frontend
will not load the file into the data/size fields and instead defer to the
implementation to manage loading the file from disk. The path might be both
relative and absolute (canonical), so the implementation must check for both
cases. This is useful if the ROM image is too large to load into memory at once.
It is also useful if the assets consist of many smaller files, where it is
necessary/preferable to use the path of a master file to infer the paths of the
others.

If `need_fullpath` is set to `false`, the frontend will load the content into
memory beforehand. In this mode, the path field is not guaranteed to be
non-`NULL`. It should point to a valid path if the file was loaded from disk,
however it is also possible that the file was loaded from `stdin` or similar,
which has no well-defined path. It is recommended that `need_fullpath` is set to
`false`, if possible, as it allows more features (such as soft-patching) to work
correctly.

#### `retro_get_system_av_info()`

This function informs the frontend about essential audio/video properties of the
core. As this information can depend on the content being loaded, this info will
only be queried after such has been loaded from a valid filepath. It is
important to accurately report frames/second and audio sampling rates, as FFmpeg
recording relies on the precision of this information to be able to run in sync
for several hours.

### Running

#### `retro_run()`

After the content has been successfully loaded, `retro_run()` will be called
repeatedly as long as the user desires. When called, the implementation will
perform its inner functionality for one video frame. During this time, the
implementation is free to trigger callbacks for video frames and audio samples
as well as poll inputs and query current input state. The requirements for the
callbacks are that video callback is called exactly once, i.e. it does not have
to come last. Also, input polling must be called at least once.

### Input

!!! abstract "Main page"
    **Learn more on the [Input API][input-api] page.**

Abstracting gamepad and other input devices is the hardest part of defining a
multi-system API, as it differs across every system. The libretro API therefore
provides the RetroPad—a gamepad/joystick abstraction available with digital and
analog controls—to allow cores to be written without platform-specific input
code.

Input device abstractions are also available for keyboards, mice, pointers, and
light guns.

### Video/Audio synchronization considerations

Libretro is based on fixed rates; video FPS and audio sampling rates are always
assumed to be constant. Frontends will have control of the speed of playback,
typically using VSync to obtain the correct speed. The frontend is free to
"fast-forward", i.e. play as fast as possible without waiting, or opt for
sub-realtime output to achieve "slow motion." For this reason, the engine should
not rely on system timers to perform arbitrary synchronization. This is common
and often needed in 3-D games to account for varying frame rates while still
maintaining a playable game.

However, libretro targets classic systems where one can assume that 100%
realtime performance will always be met, and in that way avoid the need for
careful timing code. By default, the libretro implementation should replace any
arbitrary `sleep()` and `time()` patterns with simple audio/video callbacks; the
frontend will make sure to apply the proper synchronization. This is mostly a
problem for game ports such as PrBoom. The libretro port of PrBoom relied
heavily on timers and sleeping patterns, which was replaced in the port with
simply running for one frame then calling the video callback. After that, enough
audio was rendered to correspond to one frame's worth of time (1fps seconds),
after which all sleeping and timing patterns could be removed and
synchronization remained correct.

#### Audio callback options

The libretro API has two different audio callbacks, but only one of these should
be used; the implementation must choose which callback is best suited.

One _audio frame_ is always made up of 2 int16_t samples, corresponding to the
left and right channels, respectively.

##### Per-sample audio

The first audio callback is called _per-sample_, but actually deals with a
single _audio frame_. It has the prototype `void (*retro_audio_sample_t)(int16_t
left, int16_t right)`. This should be used if the implementation generates audio
one frame at a time. The frontend will make sure to partition the audio data
into suitable chunks to avoid incurring too much syscall overhead.

##### Batch audio

If audio is output in "batches," i.e. 1fps seconds worth of audio data at a
time, the batch approach should be considered. Rather than looping over all
audio frames and calling the per-sample callback each time, the _batch callback_
should be used instead. Its prototype is `size_t
(*retro_audio_sample_batch_t)(const int16_t * samples, size_t num_frames)`. The
number of samples should be `2 * num_frames`, with the left and right channels
interleaved every frame. Using the batch callback, audio will not be copied in a
temporary buffer, which can result in a slight performance gain. Also, all data
will be pushed to the audio driver at once, saving some slight overhead.

It is not recommended to use the batch callback for very small (< 32 frames)
amounts of data. The data passed to the batch callback should, if possible, be
aligned to 16 bytes (or another platform=dependent size), to allow accelerated
SIMD operations on audio.

#### `retro_serialize_size()`, `retro_serialize()`, and `retro_unserialize()`

Serialization, better known as "save states" in emulators, is optional to
implement at the developer's discretion. These functions are certainly more
useful in emulators which have a fixed amount of "state." It allows the frontend
to take a snapshot of all internal state and later restore it, and is used to
implement features such as rewind and netplay.

Some important considerations must be evaluated to implement these functions
well:

- If serialization is not supported, `retro_serialize_size()` should return 0.
  If `retro_serialize_size()` returns a non-zero value, it is assumed that
  serialization is properly implemented.
- The frontend should call `retro_serialize_size()` before calling
  `retro_serialize()` to determine the amount of memory needed to correctly
  serialize.
- The size eventually passed to `retro_serialize()` must be at least the size of
  the value returned in `retro_serialize_size()`. If too large a buffer is
  passed to `retro_serialize()`, the extra data should be ignored (or `memset`
  to 0).
- It is valid for the value returned by `retro_serialize_size()` to vary over
  time, however it can never _increase_ over time; any changes must always be
  decreases. This is rationalized by the ability to predetermine a fixed save
  state size right after `retro_load_game()` that will always be large enough to
  hold any following serialization, and this certainty is fundamental to the
  rewind implementation. This requirement only holds between calls to
  `retro_load_game()` and `retro_unload_game()`.

If possible, the implementation should attempt to serialize data at consistent
offsets in the memory buffer. This will greatly help the rewind implementation
in RetroArch to use less memory. Both `retro_serialize()` and
`retro_unserialize()` return a boolean value to let the frontend know if the
implementation succeeded in serializing or unserializing.

### Tear-down

#### `retro_unload_game()`

Once the user desires to stop playing, `retro_unload_game()` will be called.
This should free any internal data related to the game and allow
`retro_load_game()` to be called again.

#### `retro_deinit()`

This function should free all state that was initialized during `retro_init()`.
After calling this function, the frontend can again call `retro_init()`.

### Thread safety

The libretro API does not make any thread safety guarantees, and core developers
should assume that the functions declared in the libretro header are neither
reentrant nor safe to be called by multiple threads simultaneously. If a core is
multi-threaded, then the core developer is responsible for thread safety when
making libretro API calls.

It is discouraged to do libretro API calls outside of `retro_run()`, i.e.
outside of the main thread.

## Add your core to the Libretro infrastructure

There are several steps before your core can be available to users via the
Online Updater > Core Downloader:

1. Add your Libretro core info to the
   [libretro-super repository][libretro-super-repo-info].
    - As a test, place your core's info file in `libretro_info_path`, load the
      core, and validate that the information shown by the frontend in
      `Information` --> `Core Information` is correct.
1. Add [.gitlab-ci.yml] to the root of your source code repository, so it can be
   added to the Libretro CI/CD.
1. If you want your core to be compatible with
   [RetroArch's playlists][retroarch-playlists]:
    - Add, at a minimum, icons for playlists and content for your core in the
      [RetroArch assets repository][retroarch-assets-repo].
    - Also, add your content to the
      [Libretro database repository][libretro-database-repo].
1. Add documentation for your core according to
   [these instructions][libretro-docs-guide].

[.gitlab-ci.yml]: https://git.libretro.com/libretro/RetroArch/-/commits/master/.gitlab-ci.yml?ref_type=heads ".gitlab-ci.yml • master • Libretro / RetroArch • GitLab"
[GPL-3.0-or-later]: https://spdx.org/licenses/GPL-3.0-or-later.html "GNU General Public License v3.0 or later &verbar; Software Package Data Exchange (SPDX)"
[MIT]: https://spdx.org/licenses/MIT.html "MIT License &verbar; Software Package Data Exchange (SPDX)"
[arduvor-pt1]: https://www.jroeder.net/2021/08/10/arduous-endeavor-part-1/ "An Arduous Endeavor (Part 1): Background and Yak Shaving — James Roeder"
[arduvor-pt2]: https://www.jroeder.net/2021/08/11/arduous-endeavor-part-2/ "An Arduous Endeavor (Part 2): Display Emulation — James Roeder"
[arduvor-pt3]: https://www.jroeder.net/2021/08/16/arduous-endeavor-part-3/ "An Arduous Endeavor (Part 3): CPU Emulation — James Roeder"
[arduvor-pt4]: https://www.jroeder.net/2021/08/16/arduous-endeavor-part-4/ "An Arduous Endeavor (Part 4): Input Handling — James Roeder"
[arduvor-pt5]: https://www.jroeder.net/2021/08/19/arduous-endeavor-part-5/ "An Arduous Endeavor (Part 5): Buzzes and Beeps — James Roeder"
[arduvor-pt6]: https://www.jroeder.net/2021/08/19/arduous-endeavor-part-6/ "An Arduous Endeavor (Part 6): Save States and Rewind — James Roeder"
[arduvor-pt7]: https://www.jroeder.net/2021/08/21/arduous-endeavor-part-7/ "An Arduous Endeavor (Part 7): Automated Builds — James Roeder"
[beardypig-pt1]: https://web.archive.org/web/20190219134430if_/http://www.beardypig.com/2016/01/15/emulator-build-along-1/ "Writing an Emulator: Introduction - beardypig"
[beardypig-pt2]: https://web.archive.org/web/20190219134028if_/http://www.beardypig.com/2016/01/22/emulator-build-along-2/ "Vectrex Emulator: libretro - beardypig"
[github-beardypig]: https://github.com/beardypig "GitHub: beardypig (beardypig)"
[input-api]: ../input-api.md "Libretro Input API - Libretro Documentation"
[james-roeder]: https://www.jroeder.net/about/ "About — James Roeder"
[libretro.h]: https://github.com/libretro/libretro-common/blob/master/include/libretro.h "GitHub: libretro-common/include/libretro.h at master • libretro/libretro-common"
[libretro-common-repo]: https://github.com/libretro/libretro-common "GitHub: libretro/libretro-common - useful code blocks for libretro core and frontend development"
[libretro-database-repo]: https://github.com/libretro/libretro-database "GitHub: libretro/libretro-database - cheatcode files, content data files, etc."
[libretro-deps-repo]: https://github.com/libretro/libretro-deps/ "GitHub: libretro/libretro-deps - ready-made dependencies for libretro cores"
[libretro-docs-guide]: https://github.com/libretro/docs/blob/master/README.md#adding-a-new-core "Contribute to the Libretro documentation § Adding a new core"
[libretro-samples-repo]: https://github.com/libretro/libretro-samples "GitHub: libretro/libretro-samples - A set of samples to illustrate the Libretro API."
[libretro-super-repo-info]: https://github.com/libretro/libretro-super/tree/master/dist/info "GitHub: libretro-super/dist/info at master • libretro/libretro-super"
[natesh-devblog]: https://nnarain.github.io/about/ "About &verbar; Natesh's Dev Blog!"
[natesh-gameboycore]: https://nnarain.github.io/2017/07/13/GameboyCore-as-a-libretro-core!.html "GameboyCore as a libretro core! &verbar; Natesh's Dev Blog!"
[opengl-cores]: opengl-cores.md "A use case for the Libretro OpenGL API - Libretro Documentation"
[retroarch-assets-repo]: https://github.com/libretro/retroarch-assets/tree/master/src/xmb/monochrome "GitHub: retroarch-assets/src/xmb/monochrome at master • libretro/retroarch-assets"
[retroarch-playlists]: ../../guides/roms-playlists-thumbnails.md "ROMs, Playlists, and Thumbnails - Libretro Documentation"
[retroarch-source]: https://github.com/libretro/RetroArch/releases/latest "GitHub: Latest release • libretro/RetroArch"
[skeletor]: https://github.com/libretro/skeletor "GitHub: libretro/skeletor"
[vectrexia]: https://github.com/beardypig/vectrexia-emulator/ "GitHub: beardypig/vectrexia-emulator - Vectrex Emulator"
