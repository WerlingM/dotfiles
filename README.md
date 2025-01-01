My Dotfiles

Uses Ansible and Gnu Stow to install applications and set configs.  These are my preferences and methods, feel free to 
use as a guide for your own dotfiles approach.  Or not.

Based on documentation from multiple sources:
* [Ansible for dotfiles] (https://phelipetls.github.io/posts/introduction-to-ansible/)
* [Gnu Stow](https://medium.com/quick-programming/managing-dotfiles-with-gnu-stow-9b04c155ebad)

# Running

`sudo bootstrap.sh` 

runs the whole shebang, installing the initial prerequisites and then running the playbook

