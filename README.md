
<!-- README.md is generated from README.Rmd. Please edit that file -->

# My personal template for journal articles

<!-- badges: start -->

[![R-CMD-check](https://github.com/JBGruber/paper_protest_troublemakers/workflows/R-CMD-check/badge.svg)](https://github.com/JBGruber/paper_protest_troublemakers/actions)
<!-- badges: end -->

Uses continuous integrations and checks for spelling errors and if the
article can be compiled on every commit. The article is written in the
`paper` folder. From there it can be translated into the formats
provided by the [`rticles`](https://github.com/rstudio/rticles). The
folder `sage` shows how this looks for the [Sage
template](https://uk.sagepub.com/en-gb/eur/manuscript-submission-guidelines).

The `tests` folder includes a script with two custom functions which can
be used interactively. For example, you can run this to check the
spelling of the abstract and article. If any issues are found, you will
be asked if you want to add new words to your custom dictionary.

``` r
source("./tests/functions.R")
custom_spell_check(files = c("./paper/abstract.md", "./paper/article.Rmd"), 
                   dict = "./tests/dictionary.dic")
```

The second function makes sure you have the necessary `R` packages
installed to render the document into a PDF.

``` r
install_missing()
```

Again, you will be asked if the function should correct the issues,
namely by installing missing packages.

If you are using a Linux system (maybe this works on macOS too, I don’t
care) you can compile the article using this bash command in the folder
of the article:

    make

This will run the tests locally, produce a PDF and count the words in
it.
