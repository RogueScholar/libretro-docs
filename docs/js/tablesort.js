// SPDX-FileCopyrightText: © 2020–2022, Martin Donath <martin.donath@squidfunk.com>
//
// SPDX-License-Identifier: MIT
document$.subscribe(function () {
  var tables = document.querySelectorAll("article table:not([class])");
  tables.forEach(function (table) {
    new Tablesort(table);
  });
});
