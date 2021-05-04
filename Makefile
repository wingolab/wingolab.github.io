JEKYLL_VERSION=3.8

serve: 
	bundle exec jekyll serve

serve-docker:
	rm -rf Gemfile.lock && docker build --build-arg user=$(JEKYLL_VERSION) -t jekyll-site . && docker run --rm \
	--volume="$(PWD):/srv/jekyll" \
	-p 3000:4000 \
	-it jekyll-site \
	jekyll serve --watch --drafts

serve-docker-no-build:
	docker run --rm \
	--volume="$(PWD):/srv/jekyll" \
	-p 3000:4000 \
	-it jekyll/jekyll:$(JEKYLL_VERSION) \
	jekyll serve --watch --drafts

update:
	bundle update github-pages