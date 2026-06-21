# Contribute to the documentation

<!--
  SPDX-FileCopyrightText: © 2018, Daniel De Matteis <libretro@gmail.com>
  SPDX-FileCopyrightText: © 2018, Mohmoud <devmohmoud@gmail.com>
  SPDX-FileCopyrightText: © 2024–2026,, Peter J. Mello <admin@petermello.net>

  SPDX-License-Identifier: MIT
-->
Each page is generated from a [Markdown][] file in this repository using the
[Material for MkDocs][material-mkdocs] framework, a collection of enhancements
to the [MkDocs][] static site generator for Python. If you aren't familiar with
the Markdown syntax, we suggest you start by reading [this guide][mkdocs-guide]
and following the links there to even more detailed documents that describe it.

[MkDocs][] uses some [extensions][mkdocs-extensions] that you may have to
familiarize yourself with.

## Basics

The documentation source is maintained with the help of the [Git][enwiki-git]
version control system (VCS), in a [public repository][docs-repo] hosted on
GitHub. The typical interface for working with Git repositories is the command
line, either with the [`git` command][download-git] itself or GitHub's
more-friendly CLI, [`gh`][github-cli]. For novice users that lack experience
working from the command line, the [Github Desktop][github-desktop] app is
freely available for Windows and macOS, or you can choose from a
[list of many more Git GUI clients][git-guiclients] for any modern operating
system. For more info on how to use Git, we recommend consulting GitHub's
["Using Git"][github-usinggit] and
["Contributing to a project"][github-contributing] primers.

## Editing

In order to propose improvements to an existing documentation page:

1. [Fork this repository][docs-fork] (requires a GitHub account) and then clone
   the _forked repository_ to your system. (If you are using
   [Github Desktop][github-desktop], select `Clone` --> `Open` from the menu
   bar.)
1. Make the changes you wish to propose to the local files in the clone.
1. Test your changes by following the
   [Building section of README.md][readme-building] that will launch a web
   server on your system delivering an instance of the complete documentation
   site with your changes. _**Carefully compare**_ each page you changed with
   the current live site at <https://docs.libretro.com/>, looking for errors or
   any other unintended regressions.
1. Propose your changes using the button "New Pull Request"
   [in the docs repo][docs-repo]<br />make sure that you are comparing **your
   forks edited branch** to the **docs master branch**

There is a [To-Do list for libretro/docs!][docs-todo]

You can submit suggestions or issues regarding documentation at the
[libretro/docs issue tracker][docs-issues] or in our
[forum thread][forum-thread].

## Adding a new core

These are the documents that should be added/updated when a new core is added to
the libretro ecosystem.

- Add the core to docs/library/ (Follow the
  [latest core template][core-template]).
- Add the core to mkdocs.yml
- Add the core to docs/meta/core_list.md
- Add the core to docs/meta/see_also.md if it's related to another core in some way
- Add the core to docs/tech/licenses.md
- Add the core to docs/meta/todo.md
- Add the core to docs/guides/softpatching.md if it supports softpatching
- Add the core to docs/guides/retroachievements.md if it supports cheevos

[core-template]: docs/meta/core_template.md
[docs-fork]: https://github.com/libretro/docs/fork
[docs-issues]: https://github.com/libretro/docs/issues
[docs-repo]: https://github.com/libretro/docs
[docs-todo]: https://docs.libretro.com/meta/todo/
[download-git]: https://git-scm.com/downloads
  "Git - Downloads"
[enwiki-git]: https://en.wikipedia.org/wiki/Git
[forum-thread]: https://forums.libretro.com/t/wip-adding-pages-to-documentation-site/10078/
[github-contributing]: https://docs.github.com/en/get-started/exploring-projects-on-github/contributing-to-a-project
  "Contributing to a project - GitHub Docs"
[github-usinggit]: https://docs.github.com/en/get-started/using-git
  "Using Git - GitHub Docs"
[git-guiclients]: https://git-scm.com/downloads/guis
  "Git - GUI Clients"
[github-cli]: https://cli.github.com/
  "GitHub CLI | Take GitHub to the command line"
[github-desktop]: https://github.com/apps/desktop
  "GitHub Desktop | Simple collaboration from your desktop"
[markdown]: https://daringfireball.net/projects/markdown/
  "Daring Fireball: Markdown"
[material-mkdocs]: https://squidfunk.github.io/mkdocs-material/
  "Material for MkDocs Homepage"
[mkdocs]: https://www.mkdocs.org/
  "MkDocs Homepage"
[mkdocs-extensions]: https://www.mkdocs.org/user-guide/configuration/#markdown_extensions
  "Configuration: Formatting options § markdown_extensions - MkDocs"
[mkdocs-guide]: https://www.mkdocs.org/user-guide/writing-your-docs/
  "Writing Your Docs - MkDocs"
[readme-building]: https://github.com/libretro/docs/blob/master/README.md#building
  ""
