pspec
=====

This gem depends on [parallel_tests](https://github.com/grosser/parallel_tests). Check it's page for installation
instructions.

Gem `pspec` determines *optimal processors count* ( **OPC** ) as
*processors count - 1*

Install
=====
Add to your Gemfile inside development group.
`gem 'pspec'`

Usage
=====
```sh
rake pspec
```
Runs `pspec:prepare` and `pspec:run` consequentially.

```sh
rake pspec:full_prepare
```
Migrates your database, prepares your test database, clones your test database **OPC** times.

```sh
rake pspec:prepare
```
Clones your test database **OPC** times.

```sh
rake pspec:run
```
Runs your specs in parallel using **OPC** processors.
