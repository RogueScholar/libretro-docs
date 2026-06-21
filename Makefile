#!/usr/bin/make -f
# -*- mode: makefile-gmake; coding: utf-8 -*-
# SPDX-License-Identifier: MIT
#
# SPDX-FileCopyrightInfo: © 2018, Daniel De Matteis <libretro@gmail.com>
# SPDX-FileCopyrightInfo: © 2024, Peter J. Mello <admin@petermello.net>

MKDOCS_AVAILABLE = $(shell command -v mkdocs 2>/dev/null)
mkdocs_deps      = $(shell mkdocs get-deps | LC_ALL=C tr '\n' ' ')
mkdocs_exe       = $(realpath $(MKDOCS_AVAILABLE))

build: dependencies
	@$(mkdocs_exe) build

start: dependencies
	@$(mkdocs_exe) serve

install:
	python -m pip install mkdocs mkdocs-material && \
		python -m pip install $(mkdocs_deps)

dependencies: install
ifndef MKDOCS_AVAILABLE
	$(error mkdocs is not available. Use 'make install' to install toolchain.)
endif
