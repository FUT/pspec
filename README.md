pspec
=====

This gem depends on `parallel_tests`. Check it page for installation
instructions.

Gem `pspec` determines *optimal processors count* (**OPC**) as
*processors count* - 1

Install
=====
`gem 'pspec'`

Usage
=====
```sh
rake pspec:prepare
```
Migrates your database, prepares your test database, clones your test database **OPC** times.

```sh
rake pspec:run
```
Runs your specs in parallel using **OPC** processors.
