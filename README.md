# dgr8akki/homebrew-tap

A [Homebrew](https://brew.sh) tap for my personal tools and plugins.

## Usage

Tap this repo once:

```sh
brew tap dgr8akki/tap
```

Then install any of the formulae below:

```sh
brew install <formula>
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

## Updating

If a formula has been updated upstream, refresh your tap with:

```sh
brew update
brew upgrade <formula>
```

## Uninstalling

```sh
brew uninstall <formula>
brew untap dgr8akki/tap   # optional — removes the tap entirely
```

## License

Each formula is distributed under the license of its upstream project. See the individual `*.rb` files for details.
