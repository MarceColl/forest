.PHONY: all rss build

rss:
	jj st --no-pager --quiet src/content/note/ | grep "M " | awk '{ print $2 }' | xargs  basename -a -s .mdx | xargs perl rss.perl

all:
	git add .
	git commit -am "."
	git push origin master


build:
	bun run build
	cp public/rss.xml dist/rss.xml
