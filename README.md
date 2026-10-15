# CLIP Homebrew tap

Install the Command Line Interface Protocol CLI:

```sh
brew install mcclowes/clip/clip
clip --help
```

[Source and documentation](https://github.com/mcclowes/clip)

The formula installs the versioned release archive and Node.js. Release archives contain compiled JavaScript and a bundled community capability registry, with no runtime npm dependencies.

## Checks

GitHub Actions checks every push and pull request with stable Homebrew on Linux
and macOS. It checks formula style and strict audit, installs the release archive,
and runs the formula's offline smoke tests against the current tap checkout.
Those tests cover schema/version output, bundled registry search and lint,
and tool registration and skill generation in temporary storage.
