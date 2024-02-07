
# TODOs
- [ ] refactor flake using flake-parts and remove overlays
  see:
    - [example](https://github.com/ALT-F4-LLC/thealtf4stream.nvim/blob/main/flake.nix)
    - [docu](https://flake.parts)
- Nvim config
  - [ ] go inlay hints
  - [ ] fidget with transparent background
  - [ ] nvim cmp
  - [ ] status line from old config (express line)


# overlays

- define new packages
- override some attributes of already present packages
- overlay is a function with 2 arguments (`prev` and `final`)
- `prev` is the original *untouched* nixpkgs
- `final` contains the modifications
