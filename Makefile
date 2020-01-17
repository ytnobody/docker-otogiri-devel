TAGNAME=ytnobody/otogiri-devel-container
GIT_USER=$(shell git config --get user.name)
GIT_EMAIL=$(shell git config --get user.email)

all:
	docker build -t $(TAGNAME) .

enter:
	docker run \
		-v $(HOME)/.ssh:/root/.ssh \
		-v $(HOME)/.pause:/root/.pause \
		-e GIT_USER="$(GIT_USER)" \
		-e GIT_EMAIL="$(GIT_EMAIL)" \
		--rm -it $(TAGNAME) 