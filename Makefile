clean-pycache:
	find . -type d -name __pycache__ -exec rm -r {} \+

notebook-build: clean-pycache
	docker build . -f ./docker/Dockerfile -t dsc/notebook:latest --cache-from dsc/notebook:latest

notebook-run:
	docker run -it -p 8888:8888 dsc/notebook:latest
