JEKYLL_VERSION=3.8

serve: 
	bundle exec jekyll serve

serve-docker:
	docker run --rm \
	--volume="$(PWD):/srv/jekyll" \
	-p 3000:4000 \
	-it jekyll/jekyll:$(JEKYLL_VERSION) \
	jekyll serve --watch --drafts

update:
	bundle update github-pages