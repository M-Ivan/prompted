# Prompted √

The prompt you always wanted.

## Requirements

- Obviously a UNIX based system
- No previous terminal prompt customization, as this will overwrite the PS1 variable, if you have a custom PS1 you will need to modify the `~/.bashrc` or `~/.bash_profile` file manually before installing prompted or changes might not take effect.

## Purpose

As a software developer myself, i always wanted a prompt that would help me to be more productive by saving repetitive checks for recurrent info. So i decided to create a prompt format that shows me all the info that i often require to check manually in a single line.
Prompted is a personal project, as i noticed that i was reconfiguring the same stuff over and over for new laptops. While i was thinking on the use-case i also noticed that perhaps other developers could benefit from it. So i decided to make it public.

## Features

- Show the current git branch
- Show the private ip of the machine
- Show the current working directory
- Show the current user
- Show the last executed command exit code (√ for ok)

```
√ [m-ivan@127.0.0.1 > ~/repos/prompted] (master) $
```

## Installation

```bash
$ chmod +x install.sh
$ ./install.sh
```

Uppon succefull installation, you will require to source the `~/.bashrc` or `~/.bash_profile` as the shell profile requires to reload in order for the changes to take effect. You can also restart your terminal.

## Uninstall

```bash
$ chmod +x uninstall.sh
$ ./uninstall.sh
```

After uninstalling you need to restart your terminal.

## Improvements & contributions

Prompted is a personal project, but i am open to contributions and improvements. If you have any idea on how to improve it, please feel free to open an issue or a pull request.
