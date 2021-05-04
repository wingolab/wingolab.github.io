# wingolab.github.io

Wingo lab website

## Build a local version

This uses ruby installed on your OS and assumes you have [`bundle`][1] installed.

```sh
make serve
```

## Build a local version using docker

This uses a docker container of jekyll.

```sh
make serve-docker
```

## Redirecting domains

To redirect `wingolab.com` and `wingolab.net` to `wingolab.org`
(with or without the www) modify the domain record of each to
redirect to `http://wingolab.org`.

[1]: https://bundler.io

