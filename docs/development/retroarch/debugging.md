---
title: Debugging RetroArch errors and crashes
description: A guide to troubleshooting RetroArch errors and crashes.
icon: material/bug-check-outline
status: stable
---

# Debugging RetroArch

## Dr.MinGW

Windows debug builds now have an integrated crash handler. If you find any
recurrent crashes, you can start the `retroarch_debug.exe` executable, reproduce
the crash and you should find a time-stamped crash log in the `retroarch`
directory.

## GNU Debugger (All platforms)

The [GNU Debugger][gdb], or 'gdb', is the most widely-available debugging tool
for many platforms.

!!! note "Windows users"
    This guide assumes you have already installed the MSYS2/MinGW environment as
    [detailed here][compiling-windows] and that you are working in the
    appropriate "MSYS2 MinGW32" or "MSYS2 MinGW64" shell, not "MSYS2 MSYS".

If you observe a crash with RetroArch and would like to get more information,
navigate to the folder where your RetroArch installation is and run:

``` shell
gdb retroarch
```

!!! note "Windows users"
    If you have not compiled RetroArch yourself with debugging enabled
    (`make DEBUG=1`), please specify `retroarch_debug.exe` here instead of
    `retroarch` to use the debug version that ships with our binary package. In
    order to debug in Windows 10 when the D3D10 or D3D11 video drivers are in
    use, be sure that you have also installed Microsoft's free [Windows Direct3D
    Graphics Tools][direct3d-tools] package.

After GDB has started, you can then start up RetroArch with `run`. If RetroArch
crashes, GDB should show you a prompt with a message such as:

``` text
Program received signal SIGSEGV, Segmentation fault.
```

From here, type `bt full` to get a full backtrace of the crash. You can
copy/paste this information to a Pastebin site such as [dpaste] to get a link
that you can provide to developers to help with your problem. Type `quit` to
exit GDB when you are done.

To get a full backtrace of the crash for all threads, type
`thread apply all bt full`.

For more information on using GDB, please see their
[online documentation][gdb-docs].

## AddressSanitizer (Linux/Mac/BSD/Android)

AddressSanitizer, or `ASan`, is a very fast memory error detector and an
indispensable tool for finding issues with improper memory handling, such as
use-after-free, buffer overflows and general memory leaks. It is available since
GCC 4.8 and Clang 3.1 for Linux (x64 and ARM) systems. The performance penalty
associated with using it is approximately 2x.

There are several ways to use RetroArch in conjunction with `ASan` and many
different configuration options that can be combined to control its operation.
Before using it, though, you need to compile `ASan` directly into the RetroArch
binary. Here are some simple examples for how to do so:

- **For detecting memory errors/leaks and undefined behavior:**

    ``` shell
    make DEBUG=1 SANITIZER=address,undefined
    ```

- **For detecting threading errors such as race conditions:**

    ``` shell
    make DEBUG=1 SANITIZER=thread
    ```

Once you've compiled the RetroArch binary with `ASan` you can execute it
normally with the terminal command `./retroarch` from within the build
directory. As problems are detected, they will be printed to the console either
at runtime or when the program exits or crashes, depending on the type of error.

For more information, see the [GCC][gcc-instrumentation], [Google][google-asan]
or [Clang][clang-docs] online documentation, respectively.

## Dr. Memory (Windows/Linux/Mac/Android)

[Dr. Memory][dr-memory] is another tool for detecting memory errors similar to
`ASan`. After installation, the simplest way to use Dr. Memory with RetroArch is
to open the Start menu shortcut under "Dr. Memory" labelled "Explore Dr.
Memory", and then drag the `retroarch_debug.exe` file onto the `drmemory.exe`
file there. No re-compilation is necessary to use this tool. Any errors
encountered will be displayed in a Notepad window after the program exits or
crashes.

## Valgrind (Linux)

[Valgrind][valgrind] is one of the oldest and most well-known memory error and
leak detectors available. Here is an example command-line usage to run
`valgrind` with RetroArch to check for memory or threading errors:

``` shell
valgrind -v --tool=memcheck --leak-check=yes --track-origins=yes --show-reachable=yes ./retroarch
```

No recompilation is necessary to use this tool, but make sure to run it using a
debug build of RetroArch (built with `make DEBUG=1`). Some users have reported a
large number of false positives with this tool, as well as much slower runtime
performance, so in general we typically recommend to use `ASan` instead if that
is also a viable option.

## rr (Linux)

[`rr`] is a deterministic debugger that enhances GDB by supporting the
recording, replay and even reverse-replay of a program's execution. It is very
useful for accurately reproducing a hard-to-trigger issue such as a race
condition or crash that only occurs under certain conditions.

For more information on using `rr`, please see their [usage guide][rr-usage].

## Time Travel Debugging (Windows)

[Time Travel Debugging][time-travel] is a Windows tool for recording and
replaying a program's execution, similar to [rr]. For more information, please
visit their website.

## Android Studio (Android)

See [this file][phoenix-gradle] for a guide on how to build, sideload and debug
a Libretro core using Android Studio.

[clang-docs]: https://clang.llvm.org/docs/AddressSanitizer.html
  "AddressSanitizer — Clang's documentation"
[compiling-windows]: compilation/windows.md
  "Windows 7 and later RetroArch compilation and development guide - Libretro Docs"
[direct3d-tools]: https://docs.microsoft.com/en-us/windows/uwp/gaming/use-the-directx-runtime-and-visual-studio-graphics-diagnostic-features
  "Graphics diagnostics tools - UWP applications | Microsoft Learn"
[dpaste]: https://www.dpaste.com/
  "Create a new item | dpaste.com"
[dr-memory]: https://drmemory.org/
  "Dr. Memory - Memory Debugger for Windows, Linux and Mac"
[gcc-instrumentation]: https://gcc.gnu.org/onlinedocs/gcc/Instrumentation-Options.html
  "Instrumentation Options | Using the GNU Compiler Collection (GCC)"
[gdb]: https://www.sourceware.org/gdb/
  "GDB: The GNU Project Debugger"
[gdb-docs]: https://sourceware.org/gdb/current/onlinedocs/gdb.html/
  "Debugging with GDB"
[google-asan]: https://github.com/google/sanitizers/wiki/AddressSanitizer
  "GitHub: AddressSanitizer • google/sanitizers Wiki"
[phoenix-gradle]: https://github.com/libretro/RetroArch/blob/master/pkg/android/phoenix/sideload/README.md
  "GitHub: RetroArch/pkg/android/phoenix/sideload/README.md on master • libretro/RetroArch"
[rr]: https://rr-project.org/
  "rr: lightweight recording & deterministic debugging"
[rr-usage]: https://github.com/mozilla/rr/wiki/Usage
  "GitHub: Usage • rr-debugger/rr Wiki"
[time-travel]: https://learn.microsoft.com/en-us/windows-hardware/drivers/debuggercmds/time-travel-debugging-overview
  "Time Travel Debugging - Overview - Windows drivers | Microsoft Learn"
[valgrind]: https://valgrind.org/
  "Valgrind Home"
