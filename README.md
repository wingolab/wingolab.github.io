# wingolab.github.io

Wingo lab website

## A local version using docker

An example for running a local version with docker with the site
available on `localhost:3000`.

```sh
export JEKYLL_VERSION=3.8
docker run --rm \
  --volume="$PWD:/srv/jekyll" \
  -p 3000:4000 \
  -it jekyll/jekyll:$JEKYLL_VERSION \
  jekyll serve --watch --drafts
```

## Redirecting domains

To redirect wingolab.com and wingolab.net to wingolab.org (with or
without the www) modify the domain record of each to redirect to
http://wingolab.org.

