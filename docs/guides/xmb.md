# XMB (GUI)

**XMB** was the default user interface for RetroArch, until it was succeeded by
Ozone in RetroArch 1.7.6. It is based on Sony's "cross-media bar" GUI, most
widely known from the PSP and PlayStation 3.

![XMB startup screen][xmb-main menu]

## Menu Structure

The top-level menus and playlists are displayed in a single "primary" row,
running from left to right. For the selected row item, a submenu column will
appear below it.

### Navigating the menus

XMB is designed for use with a gamepad or the keyboard.

Press <kbd>← Left</kbd> or <kbd>→ Right</kbd> to move along the primary row, and
press <kbd>↑ Up</kbd> or <kbd>↓ Down</kbd> to scroll the column. The selected
item in this column is always the first line under the primary row.

The user can press <kbd>⌫ Backspace</kbd> to go back a step.

## Input

!!! abstract "See also"
    [**Input and Controls**][input-controls]

Content is controlled using a keyboard or gamepad, connected via USB or
Bluetooth.

## Thumbnails

By default, no thumbnails are displayed. Up to two can be enabled: The primary
thumbnail will appear on the lower right side of the screen when a Playlist
entry is selected. The secondary thumbnail will appear on the left. Press
<kbd>Space</kbd> to view the thumbnails full-screen (press <kbd>Space</kbd>
again to toggle the view off).

Thumbnails can be enabled in `Settings` -> `User Interface` -> `Appearance`,
toggling the `Primary Thumbnail` and/or `Secondary Thumbnail` option. Thumbnails
can be boxart, a title screen screenshot, or a gameplay screenshot.

![XMB with 'Boxart' thumbnails enabled][xmb-thumbnails]

## Themes

XMB has a number of styles built-in. They can be changed in the `Settings` ->
`User Interface` => `Appearance` menu.

- The background color can be changed: Scroll through `Color Theme` to select a
  color.
- The animated background wallpaper can also be changed in `Shader Pipeline`,
  the default being a PlayStation-style animated ribbon.
  + XMB can even show different wallpapers depending on the playlist selected,
    as explained in [this guide][dynamic-wallpapers] using
    [these files][wallpapers].
- XMB also has a selection of icon sets to choose from `Icon Theme`.

![XMB with an alternative background color, animation, and icon set][xmb-alt-theme]
_XMB with an alternative background color, background animation, and icon set._

[dynamic-wallpapers]: https://github.com/libretro/Lakka-LibreELEC/wiki/Dynamic-Wallpapers
[input-controls]: input-and-controls.md
[wallpaper-files]: https://github.com/libretro/retroarch-assets/tree/master/wallpapers
[xmb-alt-theme]: ../image/retroarch/xmb/theme_alt.png
[xmb-main-menu]: ../image/retroarch/xmb/main-menu.jpg
[xmb-thumbnails]: ../image/retroarch/xmb/thumbnails1.png
