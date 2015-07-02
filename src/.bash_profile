# Load the shell dotfiles, and then some:
# * ~/.bash_path can be used to extend `$PATH`.
# * ~/.bash_extra can be used for other settings you don’t want to commit.
for file in ~/.{bash_path,bash_prompt,bash_exports,bash_aliases,bash_functions,bash_extra}; do
  [ -r "$file" ] && [ -f "$file" ] && source "$file";
done;
unset file;

# Check the window size after each command and, if necessary, update the values of LINES and COLUMNS
shopt -s checkwinsize;

# Case-insensitive globbing (used in pathname expansion)
shopt -s nocaseglob;

# Append to the Bash history file, rather than overwriting it
shopt -s histappend;

# Autocorrect typos in path names when using `cd`
shopt -s cdspell;

# Enable some Bash 4 features when possible:
# * `autocd`, e.g. `**/qux` will enter `./foo/bar/baz/qux`
# * Recursive globbing, e.g. `echo **/*.txt`
for option in autocd globstar; do
  shopt -s "$option" 2> /dev/null;
done;

# Add tab completion for many Bash commands
if which brew > /dev/null && [ -f "$(brew --prefix)/etc/bash_completion" ]; then
  source "$(brew --prefix)/etc/bash_completion";
elif [ -f /etc/bash_completion ]; then
  source /etc/bash_completion;
fi;

# Enable tab completion for `g` by marking it as an alias for `git`
if type _git &> /dev/null && [ -f /usr/local/etc/bash_completion.d/git-completion.bash ]; then
  complete -o default -o nospace -F _git g;
fi;

# Custom gitignore and gitattributes based on home directory location
if which git > /dev/null; then
  git config --global core.excludesfile "~/.gitignore";
  git config --global core.attributesfile "~/.gitittributes";
fi;

# Enable tab completion for awscli
if which aws_completer > /dev/null; then
  complete -C aws_completer aws;
fi;

# Load extensions to virtualenv
if which brew > /dev/null && [ -f "$(brew --prefix)/bin/virtualenvwrapper.sh" ]; then
  source "$(brew --prefix)/bin/virtualenvwrapper.sh";
fi;

# Enable shims and autocompletion for ruby
if which rbenv > /dev/null; then
  eval "$(rbenv init -)";
fi;
