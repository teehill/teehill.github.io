MD_FILES = resume.md resume-1page.md
YAML = resume.yaml
CSS = resume.css

PDF_FILES = $(MD_FILES:.md=.pdf)
DOCX_FILES = $(MD_FILES:.md=.docx)
HTML_FILES = $(MD_FILES:.md=.html)

all: pdf docx html

pdf: $(PDF_FILES)
docx: $(DOCX_FILES)
html: $(HTML_FILES)

%.pdf: %.md $(YAML) $(CSS)
	pandoc $< \
		--metadata-file=$(YAML) \
		--css=$(CSS) \
		--pdf-engine=xelatex \
		-o $@

%.docx: %.md $(YAML)
	pandoc $< \
		--metadata-file=$(YAML) \
		-o $@

%.html: %.md $(YAML) $(CSS)
	pandoc $< \
		--metadata-file=$(YAML) \
		--css=$(CSS) \
		--standalone \
		-o $@

clean:
	rm -f $(PDF_FILES) $(DOCX_FILES) $(HTML_FILES)