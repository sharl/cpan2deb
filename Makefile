all: .env build
	docker run --rm -it --env-file .env -v "$$PWD:/tmp" -e MODULE=${MODULE} cpan2deb

build: Dockerfile
	docker build . -t cpan2deb

.env: ~/.gitconfig Makefile
	echo DEBFULLNAME="$$(git config --global user.name)"		 >  $@
	echo DEBEMAIL="$$(git config --global user.email)"		 >> $@
	echo USER=${USER}						 >> $@
