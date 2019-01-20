.PHONY: sourcery format

all:
	@echo "sourcery - generate files" 
	@echo "format   - format generated files" 

sourcery: 
	@hash sourcery 2>/dev/null || { echo >&2 "sourcery is not installed. Install homebrew, then brew install sourcery."; exit 1; }
	@sourcery --watch --verbose --sources sources/main/crud/InputActivityEntity.swift --templates sourcery/templates/ --output sourcery/output

format:
	@hash swiftformat 2>/dev/null || { echo >&2 "swiftformat is not installed. Install homebrew, then brew install swiftformat."; exit 1; }
	@swiftformat sourcery/output --output sourcery/output --allman true --comments ignore --header strip --indent 4
