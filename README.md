## About
A simple directory containing shell scripts that can be used in other shell
scripts. Used in the [sched](https://ragingtiger.github.io/sched/), [tdls](https://ragingtiger.github.io/tdls/), and [priority](https://ragingtiger.github.io/priority/) utilities

## Installation
To install, simply follow these steps. First clone and navigate into these
`ShellLib/` directory:

```
git clone https://github.com/RagingTiger/ShellLib
cd ShellLib/
```

Once you have navigated into the directory, update your shell config file
(i.e. .bashrc, .zshrc, etc ...) using these commands:

```
printf "\n# ShellLib export statement" >> "$HOME/.`basename $SHELL`rc"
printf "\nexport SHELLLIB=$PWD" >> "$HOME/.`basename $SHELL`rc"
source "$HOME/.`basename $SHELL`rc"
```

Now you should be all set to use all of the [sched](https://ragingtiger.github.io/sched/), [tdls](https://ragingtiger.github.io/tdls/), and [priority](https://ragingtiger.github.io/priority/).
