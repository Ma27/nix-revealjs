`nix-revealjs`
=============

Simple `nix`-based environment to generate presentations with Reveal.js

## Usage

### Using it on a `nix`-based environment

```
git clone git@github.com:Ma27/nix-revealjs
cd $_

nix-shell -A shell
bin/generate /path/to/the/presentation
```

This creates the specified directory and runs `yo reveal` inside the directory.
After that it generates nix packages for the NPM and Bower dependencies and builds them in order to make them usable in the `nix-shell`.

When the command finished, the Reveal.js environment can be opened with `nix-shell -A shell`.

### Using it on a non-`nix` environment

In some cases multiple people work on a presentation and some of the are `nix`-users.
If the user who bootstraps the presentation doesn't use `nix`, he can do the following to build the presentation with a `nix` environment:

```
git clone git@github.com:Ma27/nix-revealjs
cd $_
npm install -g yo generator-reveal bower2nix node2nix

bin/generate /path/to/the/presentation --skip-build
```
