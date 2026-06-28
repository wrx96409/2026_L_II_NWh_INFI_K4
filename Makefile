.PHONY: deps lint test run clean

deps: 
	pip install -r requirements.txt;
	pip install -r test_requirements.txt     

lint: 
	flake8 hello_world test

test:
	pytest test/ -v

run:
	python main.py
	.PHONY test

docker_build: 

	docker build -t hello-world-printer .


USERNAME = wrx96409  # ZMIEŃ NA SWOJĄ!
TAG = $(USERNAME)/hello-world-printer-k7-2026

docker_push: docker_build
	@docker login --username $(USERNAME) --password $${DOCKER_PASSWORD}; \
	docker tag hello-world-printer-k7-2026 $(TAG); \
	docker push $(TAG); \
	docker logout;