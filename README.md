# Fedora Post Installation

These are installation instructions that I personally use after a brand new Fedora installation. They are customized for my personal needs, but that doesn't mean you can't benefit from them.

Before running any of the scripts in this repository, I strongly recommend running full system upgrade with

```bash
sudo dnf upgrade -y
```

You might also want to reboot the system just in case.

## Change hostname

By default, your hostname is localhost which in my personal opinion is the worst thing to see after opening a new terminal window... So, change it:

```bash
$ sudo hostnamectl set-hostname your-new-hostname
```

where you should replace `your-new-hostname` with the hostname you'd like to use.

## `fedora-install.sh`

`fedora-install.sh` is a bash script that

- Enables RPM Fusion, both free and non-free repositories
- Add `flathub` and `snapd` support
- Installs [Flat Remix](https://drasite.com/flat-remix) theme along with Gnome Tweaks tool
- Install VS Code and developer tools for C/C++, Node.js, Java and C#

You should run the script as `sudo`

```bash
sudo bash fedora-install.sh
```

## `git-setup.sh`

`git-setup.sh` is a bash script that handles initial Git configuration (username and email) as well as generates a new SSH key, adds it to the `ssh-agent` and displays it in the terminal for copy-pasting it to your GitHub/GitLab console.

Here's the example usage:

```bash
bash git-setup.sh 'John Doe' 'john.doe@gmail.com'
```

As you can see, the first positional argument is your username, and the second one your email. The SSH key will be generated for the provided email.

## `flutter-install.sh`

`flutter-install.sh` is a bash script that install Flutter from the Snap Store and runs the `flutter` command to initialize download and install. Upon completion, it runs the `flutter doctor` command to display useful information related to installed components / lack of them on your system, so you can resolve possible issues yourself.

This script requires operational `snapd` on your system!

Besides installation of the Flutter SDK, this script also enables web support. At the moment, this is done by switching over to beta channel.
