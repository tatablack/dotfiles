# Dotfiles
You've likely seen something like this before.
`dotfiles` are the heart of a machine's configuration, and it's common to keep them online, both as a backup and a blueprint, to use them for new accounts, or on entirely new machines.

This repo assumes usage of the [`chezmoi`](https://www.chezmoi.io/) dotfiles manager; hence the apparently weird naming conventions for certain folders and files.

I mentioned the occasional need of setting up an entirely new machine. In that case, `dotfiles` are only part of the picture, as you typically need to install a certain set of applications, ensure the OS is set up just how you like it, and so on. For this purpose, there is an initial bootstrap script, and some later—stage companion scripts, to perform installation and configuration tasks.

This repo currently assumes an Apple computer is being used. I plan to expand it to account for my Synology NAS and, possibly, Windows, albeit to a lesser extent.

## Bootstrap
This is where it all starts.

However, if you're stting up a new Mac, there are still a few manual actions needed before running the script:

- in System Preferences, configure your Apple ID
- in System Preferences - Security and Privacy - FileVault, configure disk encryption 
- in System Preferences - Security and Privacy - Privacy - Accessibility, add Terminal.app to the list 
- ensure you're logged in to the App Store

Now you can execute the bootstrap script, with:

```curl -fsSL https://raw.githubusercontent.com/tatablack/dotfiles/master/mac/bootstrap```

This will:
- ask for some information up front, namely:
	- your Apple Store email
	- your Bitwarden email (defaults to the one just entered)
	- custom Bitwarden server URL
    - a new hostname for your computer
    - your GitHub username
- install HomeBrew (which in turn will install Apple's own Command Line Developer Tools, if needed)
- using HomeBrew, install a few formulas, namely:
    - `chezmoi` - dotfiles manager
    - `mas` - Mac App Store command-line interfac
    - `rbw` - Unoffical Bitwarden CLI
- execute `chezmoi init --apply <Your GitHub username>`. This will:
	- clone the `dotfiles` repo for the given user
	- ask for some pieces of information (e.g. email for git, machine type)
	- run `brew bundle install`
	- process dotfiles and copy them to the home folder
	- install some Visual Studio Code extensions

