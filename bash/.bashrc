#########################
# Bash specific options #
#########################

# If not running interactively, don't do anything
case $- in
	*i*) ;;
	*) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# Enable extended globbing
shopt -s extglob

#########################
# Environment Variables #
#########################

# Set terminal prompt
PS1='[\u@\h \W]\$ '

# Set default editor
export EDITOR="nvim"

# Set default pager for ranger
export PAGER="less"

# Add ~/bin to the system path
export PATH=~/bin:$PATH

# Set 256 colors
#export TERM=xterm-256color
[[ -n "$TMUX" ]] && export TERM=xterm-256color

###########################
# Other environment stuff #
###########################

# load xmodmap mappings
#xmodmap ~/.Xmodmap

#####################
# Other Shell Stuff #
#####################

###########
# Aliases #
###########

#===========
# ls aliases
#===========

alias ls='ls --color=auto'
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias l.='ls -d .+([a-zA-Z_])*?(-)'
alias ll='ls -l'

#=============
# grep aliases
#=============

# Add color to grep matches
alias grep='grep --color=auto'

# grep with Perl regex syntax
greP() {
	grep -P "$@"
}

#=====================
# Administrative stuff
#=====================

# Package management
# ------------------

# Make pacman display colored output
alias pacman='pacman --color auto'

# Force trizen to search just the AUR
alias trizen='trizen --aur'

# Sourcing .bashrc file
# ---------------------
alias srcbash='source ~/.bashrc'

# Managing files and directories
# ------------------------------

# Make file executable
x() { chmod +x "$@"; }

# Combine pdf files
joinpdf() {
	gs -sDEVICE=pdfwrite -sPAPERSIZE=a4 -dFIXEDMEDIA -dPDFFitPage \
		-dCompatibilityLevel=1.4 -o "$@"
}

# Compress pdf files
presspdf() {
	gs -dNOPAUSE -dBATCH -dQUIET -sDEVICE=pdfwrite \
		-dCompatibilityLevel=1.4 -dPDFSETTINGS=/ebook -o "$@"
}

# Create numbered directories from cat output
numbered_dirs() {
	nl -n rz -w 2 -s "-" - | xargs mkdir
}

# Convert files to dotfiles
# (Makes it so that I don't have to move files to another directory for "file-not-found"
# checks)
dot() {
	for file in "$@"; do
		mv "$file" ".${file}"
	done
}

# Convert dotfiles back to their original state
# (Undoes dot())
# Note: ${file#.} is substring removal. Google parameter expansion for more details
undot() {
	for file in "$@"; do
		mv "$file" "${file#.}"
	done
}

# Convert files into backup files
# (Add the .bak extension to the files)
bak() {
	perl-rename 's/$/\.bak/' "$@"
}

# Make backup copy of file
cpbak() {
	for file in "$@"; do
		cp "$file" "${file}.bak"
	done
}

# Convert backup files to regular files
unbak() {
	perl-rename 's/\.bak$//' "$@"
}

# Create an alias to the perl-rename command
# For some reason this doesn't work. I'll have to figure out why.
#alias rename='perl-rename'

#===============
# Neovim aliases
#===============

# Set nvim to vim
#vim() {
	#nvim "$@"
#}
alias vim="nvim"

#=============
# Wine aliases
#=============

# Prevent wine from adding menu entries and/or desktop links
WINEDLLOVERRIDES=winemenubuilder.exe=d

# Alias for ~/.wine32 prefix
alias wine32='WINEARCH=win32 WINEPREFIX=~/.wine32'

# Alias for Steam installed in .wine32
alias steam-wine32='wine32 primusrun wine ~/.wine32/drive_c/Program\ Files/Steam/Steam.exe -no-cef-sandbox'

#==================
# Programming Stuff
#==================

# git
#----

# Create and initialize repo
gitrepo() {
	REPONAME=( "$@" )
	for repo in ${REPONAME[@]}; do
		mkdir $repo
		cd $repo
		git init
		cd ..
	done
}

# Python
#-------

export WORKON_HOME=~/.pyenvs
source /usr/bin/virtualenvwrapper.sh

#====================
# Programming aliases
#====================

# C++
#----

# Compile program
cppcpl() {
	FILE="$1"
	g++ -Wall -std=c++11 -o "${FILE%.*}" "$FILE"
}

# Compile and run the program
cppcplr() {
	FILE="$1"
	cppcpl "$FILE"
	if (( $? == 0 )); then
		x "${FILE%.*}"
		./"${FILE%.*}"
	fi
}

# Create program directory and file both with the same name
cppdir() {
	DIR="$1"
	mkdir $DIR
	touch $DIR/${DIR}.cpp
}

# Python
#-------

# Start ipython in a cleared terminal screen
alias ipython='clear && ipython --no-banner'
# alias ipython='clear && rlwrap -a ipython --no-banner'

# R
#--

# Start R in quiet mode
alias R='clear && R --quiet'

# Java
#-----

# Start the eclim sever
alias eclimd='~/.eclipse/org.eclipse.platform_4.6.2_155965261_linux_gtk_x86_64/eclimd'

#======================================
# Aliases for databases/web development
#======================================

# Start MySQL with vim keybindings enabled
#-----------------------------------------
mysql() {
	rlwrap -aPassword: mysql "$@"
}

# Start MySQL with root account and vim keybindings enabled
#----------------------------------------------------------
alias mysqlroot='rlwrap -aPassword: mysql -u root -p'

#==========
# Net stuff
#==========

# Ping google to test internet connectivity
alias testnet='ping -c 3 www.google.com'

#===============
# Matlab aliases
#===============

# Run MATLAB in the terminal without the graphical aspects
#alias matterm='rlwrap -a matlab -nodesktop -nosplash -r "clc"'

#==================================
# Aliases for accessing directories
#==================================

# Stuff pertaining to linux in general
alias linbook='cd ~/linux_stuff/stuff_from_books'
alias vimstuff='cd ~/linux_stuff/vim_stuff'
alias linstuff='cd ~/linux_stuff'

# Stuff pertaining to python programming
alias pyproj='cd ~/programming/langs/Python/python_projects'
alias pyprac='cd ~/programming/langs/Python/Practice'

# Stuff pertaining to Haskell programming
alias haskmain='cd ~/programming/langs/Haskell'
alias haskbook='cd ~/programming/langs/Haskell/textbook_notes'

# Programming directory in ~/programming/langs
# Main directory
alias pymain='cd ~/programming/langs/Python'
alias javamain='cd ~/programming/langs/Java'
alias cppmain='cd ~/programming/langs/C++'
# Book
alias pybook='cd ~/programming/langs/Python/textbook_notes'
alias cppbook='cd ~/programming/langs/C++/book_exercises'
alias perlbook='cd ~/programming/langs/Perl'
alias sabook='cd ~/programming/langs/sed_and_awk'
alias rubook='cd ~/programming/langs/Ruby'
alias elixbook='cd ~/programming/langs/Elixir'
alias julbook='cd ~/programming/langs/Julia'
alias scripts='cd ~/programming/langs/Scripts'
alias gitbook='cd ~/programming/langs/Git/textbook_notes'
alias rbook='cd ~/programming/langs/R/textbook_notes'
alias scalbook='cd ~/programming/langs/scala/textbook_notes'
alias javabook='cd ~/programming/langs/Java/textbook_notes'
alias mysqlbook='cd ~/programming/langs/MySQL/textbook_notes'

# Top level of all programming directories
alias proghome='cd ~/programming'
alias proglang='cd ~/programming/langs'
alias progproj='cd ~/programming/projects'

# Aliases for the school_stuff directory in Documents
alias schoolstuff='cd ~/Documents/school_stuff'

# Stuff pertaining to textbooks and their notes
alias textnote='cd ~/Documents/school_stuff/textbook_notes'
alias statnote='cd ~/Documents/school_stuff/textbook_notes/Math/Statistics'
alias probnote='cd ~/Documents/school_stuff/textbook_notes/Math/Probability'
alias mlnote='cd ~/Documents/school_stuff/textbook_notes/Machine Learning"'
alias algnote='cd ~/Documents/school_stuff/textbook_notes/Algorithms'
alias linalgnote='cd ~/Documents/school_stuff/textbook_notes/Math/lin_alg'
alias optnote='cd ~/Documents/school_stuff/textbook_notes/Math/optimization'
alias numethnote='cd ~/Documents/school_stuff/textbook_notes/Math/numerical_methods'
alias datscinote='cd ~/Documents/school_stuff/textbook_notes/Data_Science'

#====================
# Convenience aliases
#====================

# Exit terminal
alias q='exit'

# Moving to the directory above
#------------------------------

# Maybe combine the following three aliases into a function

# Go up one directory
alias ..='cd ..'

# Go up two directories
alias ...='cd ../..'

# Go up three directories
alias ....='cd ../../..'

# View the directory(ies) above the current one
#----------------------------------------------

# Go up one directory and list contents
alias l..='cd .. && ls'

# Go up two directories and list contents
alias l...='cd ../.. && ls'

# Go up three directories and list contents
alias l....='cd ../../.. && ls'

# Viewing and cd-ing into directories
#------------------------------------

# cd into directory and immediately list contents
cdl() {
	cd "$@" && ls
}

# ls but with directories displayed before files
lsd() {
	ls --group-directories-first "$@"
}

# Combine cdl and lsd
cdlsd() {
	cd "$@" && ls --group-directories-first
}

# Clear screen and list directory contents
alias cls='clear && ls'
