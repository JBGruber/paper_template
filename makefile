TITLE  := template
OUTPUT_DIR  := output

all: test-before compile clean count

query-dependencies:
	Rscript -e "source('./tests/functions.R'); \
	install_missing(path = '.', install_dependencies = TRUE); \
  install_missing(path = '.')

# needs littler package
test-before:
	r -i -e 'testthat::test_file("./tests/before.R", reporter = c("Fail", "CompactProgress"))'

compile:
	mkdir -p $(OUTPUT_DIR)
	Rscript -e "rmarkdown::render('./sage/sage.Rmd', output_file = '../$(OUTPUT_DIR)/$(TITLE).pdf')"

clean:
	find . \
	-name '*.log' -o \
	-name '*.aux' -o \
	-name '*.toc' | \
	xargs rm -f; 
	
count:
	pdftotext "./$(OUTPUT_DIR)/$(TITLE).pdf" - | wc -w
	