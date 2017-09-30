.PHONY: test.pdf watch

test.pdf: test.md
	pandoc	--template=template/template.tex \
			--listings \
			--top-level-division=chapter \
			test.md \
			bibliography.md \
			-o "build/test.pdf"
	xdg-open build/test.pdf

watch:
	while true; do inotifywait -e close_write . && make test.pdf; done
