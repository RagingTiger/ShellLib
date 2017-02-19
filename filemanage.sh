#!/usr/bin/env bash

# globals
help_doc="
Usage:
    $cmdname                 Simply prints out current $cmdname file
    $cmdname rm              Removes entire $cmdname file
    $cmdname ed              Opens $cmdname file in nano editor
    $cmdname add <entry>     Adds new entry to $cmdname file
    $cmdname read            Allows for scrollable reading of $cmdname file
    $cmdname help            Prints out this help doc"

# functions
print_help () {
  echo "$help_doc"
}

print_file() {
  # check for .todolist
  if exists; then
    cat "$1"
  else
    # create new todolist?
    create
  fi
}

exists() {
  if [ -e "$file" ]; then
    return 0
  else
    return 1
  fi
}

edit_file() {
  if exists; then
    nano $file
  else
    create
  fi
}

read_file() {
  if exists; then
    less $file
  else
    create
  fi
}

remove_file() {
  if exists; then
    # get answer
    answer=
    echo "Delete $cmdname file?[y|n]: \c"
    read answer

    # check answer
    case $answer in
      "yes") rm $file;;
      "y") rm $file;;
    esac
  else
    :
  fi
}

addto_file() {
  if [[ -z "$@" ]]; then
    echo "Must provide text to write"
  else
    if exists; then
      shift
      echo "$@" >> $file
    else
      create $@
    fi
  fi
}

template() {
  # create empty todolist
  touch $file
  echo "$HEADER" >> $file

  # check for add
  if [ -z "$1" ]; then
    :
  else
    addto_file$@
  fi

  # ask about editing
  answer=
  echo "Would you like to open and start editing new $cmdname file?[y|n]: \c"
  read answer

  # check answer
  case $answer in
    "yes") edit_file;;
    "y") edit_file;;
  esac
}

create() {
  # create new todolist?
  local answer
  echo "No $cmdname file found. Create one?[y|n]: \c"
  read answer

  # check answer
  case $answer in
    "yes") template $@;;
    "y") template $@;;
  esac
}

main() {
  # no args
  if [ -z "$1" ]; then
    # cat
    print_file $file

  else
    # check args
    case $1 in
      "add") addto_file $@;;
      "-a") addto_file $@;;
      "ed") edit_file;;
      "-e") edit_file;;
      "rm") remove_file;;
      "-r") remove_file;;
      "read") read_file;;
      "-rd") read_file;;
      "help") print_help;;
      "-h") print_help;;
    esac
  fi
}
