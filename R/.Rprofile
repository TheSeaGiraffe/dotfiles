# Include local R library in library path
.libPaths(c('~/.Rlibs', .libPaths()))

#Load packages
library(pacman)
p_load(ggplot2, gridExtra, grid, reshape2, dplyr, utils)

# Set install.packages to install to ~/.Rilbs
options(lib='~/.Rlibs')

# Don't automatically convert strings to factors
options(stringsAsFactors = F)

# Set R terminal width to 80
options(width = 80)

# Overwrite 'quit' function to disable save prompt upon quitting
# Figure out exactly what this does
assignInNamespace(
	'q',
	function(save = 'no', status = 0, runLast = T)
	{
		.Internal(quit(save, status, runLast))
	},
	'base'
)

# Set CRAN mirror
local({
r <- getOption('repos')
r['CRAN'] <- 'https://cran.csiro.au'
options(repos = r)
})

# Create a new invisible environment for your personal functions to go in
.myFuns <- new.env()

# Single character shortcuts for summary() and head()
.myFuns$s <- base::summary
.myFuns$h <- utils::head

# Function for a pager like less
.myFuns$less <- function(x) {
	file <- tempfile()
	sink(file)
	on.exit(sink())
	print(x)
	file.show(file, delete.file = T)
}

# Breaks for ggplot2 histograms
# Sturges
.myFuns$stBreaks <- function(dataVar) {
	dataVar <- na.omit(dataVar)
	pretty(range(dataVar), n = nclass.Sturges(dataVar), min.n = 1)
}

# Freedman-Diaconis
.myFuns$fdBreaks <- function(dataVar) {
	dataVar <- na.omit(dataVar)
	pretty(range(dataVar), n = nclass.FD(dataVar), min.n = 1)
}

# Attach the environment above
attach(.myFuns)

# .First() run at the start of every R session
#.First <- function() {
	#cat('Successfully loaded .Rprofile at', date(), '\n')
#}

# .Last() run at the end of the session
#.Last <- function() {
	#cat('\nGoodbye at', date(), '\n')
#}
