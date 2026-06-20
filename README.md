# homebrew-tap

Homebrew formulae for [@fabitosh](https://github.com/fabitosh)'s tools.

## Install

```sh
brew install fabitosh/tap/tailcloak
```

Or tap first, then install:

```sh
brew tap fabitosh/tap
brew install tailcloak
```

## Formulae

| Formula | Description |
| --- | --- |
| [`tailcloak`](Formula/tailcloak.rb) | Automatically toggle Tailscale based on trusted default-gateway MAC addresses (macOS). [Repo](https://github.com/fabitosh/tailcloak) |

## Updating a formula

When `tailcloak` cuts a new release, bump `url` and `sha256` in
[`Formula/tailcloak.rb`](Formula/tailcloak.rb):

```sh
curl -sL https://github.com/fabitosh/tailcloak/archive/refs/tags/vX.Y.Z.tar.gz | shasum -a 256
```
