.PHONY: all

public/rss.xml:
	jj st --no-pager --quiet src/content/note/ | grep "M " | awk '{ print $2 }' | xargs  basename -a -s .mdx | xargs perl rss.perl

all: public/rss.xml
	git add .
	git commit -am "."
	git push origin master

