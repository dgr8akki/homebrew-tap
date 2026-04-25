# dgr8akki/homebrew-tap

A [Homebrew](https://brew.sh) tap for my personal tools and plugins.

## Usage

Tap this repo once:

```sh
brew tap dgr8akki/tap
```

Then install any of the formulae or casks below:

```sh
brew install <formula>          # CLI tools / shell plugins
brew install --cask <cask>      # macOS .app bundles
```

## Formulae

### `faahzsh`

A zsh/bash plugin that plays a **"faaaah"** sound whenever a command exits with a non-zero status code. Because your failures deserve to be heard.

- Source: https://github.com/dgr8akki/faahzsh
- Install:
  ```sh
  brew install faahzsh
  ```
- After install, follow the caveats printed by `brew info faahzsh` to source the plugin from your shell config.

### `nano-ffmpeg`

A beautiful terminal UI for `ffmpeg`.

- Source: https://github.com/dgr8akki/nano-ffmpeg
- Install:
  ```sh
  brew install nano-ffmpeg
  ```
- Depends on `ffmpeg-full`, which Homebrew will install automatically.

## Casks

### `kestrel`

A native macOS menu-bar recorder for **USB-C HDMI capture cards**. Previews and records to fragmented MP4 (HEVC + AAC), fully offline. Tuned for 4K60 capture on Apple Silicon.

- Source: https://github.com/dgr8akki/kestrel
- Install:
  ```sh
  brew install --cask kestrel
  ```
- Requires macOS 14 (Sonoma) or newer on Apple Silicon. The cask is ad-hoc codesigned (not Apple-notarised) and removes the quarantine attribute on install — see `brew info --cask kestrel` for details.

## Updating

If a formula or cask has been updated upstream, refresh your tap with:

```sh
brew update
brew upgrade <formula>          # for formulae
brew upgrade --cask <cask>      # for casks
```

## Uninstalling

```sh
brew uninstall <formula>
brew uninstall --cask <cask>
brew untap dgr8akki/tap         # optional — removes the tap entirely
```

## License

Each formula is distributed under the license of its upstream project. See the individual `*.rb` files for details.
