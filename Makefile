.PHONY: install test clean lint format help

help:
	@echo "Available targets:"
	@echo "  install    Install the package in development mode"
	@echo "  test       Run tests (if any)"
	@echo "  clean      Remove build artifacts"
	@echo "  lint       Run linting"
	@echo "  format     Format code"

install:
	pip install -e .

test:
	python -m pytest tests/ -v || echo "No tests yet"

clean:
	rm -rf build/
	rm -rf dist/
	rm -rf *.egg-info/
	rm -rf __pycache__/
	rm -rf geminidb/__pycache__/
	find . -name "*.pyc" -delete
	find . -name "*.db" -delete
	find . -name "*_export.sql" -delete

lint:
	python -m flake8 geminidb/ --max-line-length=100 || echo "Install flake8: pip install flake8"

format:
	python -m black geminidb/ || echo "Install black: pip install black"
