# Dotfiles
You've likely seen something like this before.

`dotfiles` lie at the heart of a machine's configuration, and it's common to keep them online, both as a backup and a blueprint, to use them for new accounts, or on entirely new machines, and also because they may be useful to other people.

This repo assumes usage of the [`chezmoi`](https://www.chezmoi.io/) dotfiles manager; hence the apparently weird naming conventions for certain folders and files.

I mentioned the occasional need of setting up an entirely new machine. In that case, `dotfiles` are only part of the picture, as you typically need to install a certain set of applications, ensure the OS is set up just how you like it, and so on. For this purpose, there is an initial bootstrap script, and some later—stage companion scripts, to perform installation and configuration tasks.

This repo currently assumes an Apple computer is being used. I plan to expand it to account for my Synology NAS and, possibly, Windows, albeit to a lesser extent.

## Bootstrap
This is where it all starts.

However, if you're setting up a new Mac, there are still a few manual actions needed before running the script:

- in System Preferences, configure your Apple ID
- in System Preferences - Security and Privacy - FileVault, configure disk encryption
- in System Preferences - Security and Privacy - Privacy - Accessibility, add Terminal.app to the list 
- in System Preferences - Security and Privacy - Privacy - Full Disk Access, add Terminal.app to the list 
- ensure you're logged in to the App Store

Note: if you later switch to a different terminal app (e.g. iTerm), and you plan to run `chezmoi update` in the future, you'll need to change the "Security and Privacy" settings as above, but referencing the other terminal app (otherwise you'll see some permission errors, for example when executing `defaults write ...` commands). 

Now you can execute the bootstrap script, with:

```/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/tatablack/dotfiles/master/mac/bootstrap)```

This will:
- ask for some information up front, namely:
	- your Bitwarden email
	- your custom Bitwarden server URL
    - your GitHub username
    - a hostname for the new computer
- install HomeBrew (which in turn will install Apple's own Command Line Developer Tools, if needed)
- using HomeBrew, install a few formulas, namely:
    - `bash` - Not my default shell, but needed to run certain scripts
    - `chezmoi` - dotfiles manager
    - `mas` - Mac App Store command-line interface
    - `pinentry-mac` - Pinentry GUI, used by `rbw`
    - `rbw` - Unoffical Bitwarden CLI
- execute `chezmoi init --apply <your GitHub username>`. This will:
	- clone the `dotfiles` repo for the given user
	- ask for some pieces of information (e.g. email for git, machine type)
	- run `brew bundle install`
	- process dotfiles and copy them to the home folder
	- install Rosetta if needed
    - set the default shell to `fish`
    - configure `asdf` (by installing a bunch of plugins and languages)
	- set some defaults for the OS
	- install some Visual Studio Code extensions
