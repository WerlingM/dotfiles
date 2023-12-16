
This dotfiles approach follows the bare repo technique outlined in [this article](https://www.atlassian.com/git/tutorials/dotfiles).

There are main branches for the operating system: ubuntu, mac, windows (well, not Windows yet...)

# First, setup Git
On a new machine we need to set up Git with the basic configuration and keys to access github so we can pull down this repo.  First, set identity in the config:

```bash
git config --global user.email someone@somewhere.com
git config --global user.name Some One 
```

Now, connect to github.  There are several ways to do this, check github for the latest security recommendation.  The way that currently works for me is using the GitHub CLI

## [github cli](https://cli.github.com/).  
Follow the installation instructions for your platform

Linux:
First, check if curl is installed, then get the Github CLI GPG key to verify the package.  Then use apt to install:

```bash
type -p curl >/dev/null || (sudo apt update && sudo apt install curl -y)
curl -fsSL https://cli.github.com/packages/githubcli-archive-keyring.gpg | sudo dd of=/usr/share/keyrings/githubcli-archive-keyring.gpg \
&& sudo chmod go+r /usr/share/keyrings/githubcli-archive-keyring.gpg \
&& echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" | sudo tee /etc/apt/sources.list.d/github-cli.list > /dev/null \
&& sudo apt update \
&& sudo apt install gh -y
```

For Mac use `brew install gh`

For Windows use `winget install --id GitHub.cli`


Use the CLI whenever you need to authenticate.
`gh auth login`

Which will prompt:
- Account: GitHub.com
- Protocol: HTTPS
- Auth with credentials: Yes
- How would you like to authenticate? Login with a web browse

This will open a browser, go through login (including standard 2FA). Then it will display another code block, enter the code displayed in the terminal.  I didn't have luck copy/paste this code, had to input manually.

Finally you can clone this repo in whatever folder you are keeping projects (e.g. ~/workspace):
`git clone --bare https://github.com/WerlingM/dotfiles.git` > $HOME/.cfg


Set up the alias to make the repo work in the home folder:
`alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'`

Check out the branch corresponding to the current OS (ubuntu, mac)
`config checkout ubuntu`

There may be some errors for files that already exist, depending on how recently the system was created and what default settings/apps are used.  Back those files up to a temp folder and try cloning again.

# Initial Setup of the Repo

This is at the end because it isn't done much.  If you are starting to use this method from scratch, without an existing repository, here are the setup steps (again from [this article](https://www.atlassian.com/git/tutorials/dotfiles))

```bash
git init --bare $HOME/.cfg
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
config config --local status.showUntrackedFiles no
```

When updating files for the repo use the alias `config` rather than the `git` command.  The repo tracks files in the home folder and subfolders; if there are files outside of the home folder then use some other technique like symlinks.  The `.dotfiles` folder contains this readme and any scripts, configs, or other artifacts that aren't home folder configuration files.

This sets up a bare repo in $HOME that references the entire $HOME tree.  Configuring showUntrackedFiles means only already tracked files will be in `config status`, so you don't see _everything_ in the lists.

# Next Steps

[Ubuntu](../.dotfiles/README_ubuntu.md)
[Mac OS](../.dotfiles/README_mac.md)