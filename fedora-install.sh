# This is a post-installation script that you can use to quickly bootstrap
# your Fedora developer environment.
# You should run it with elevated privileges (sudo bash fedora-install.sh)

# Enable RPM Fusion (free and non-free repos)
dnf install https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm

# Add Flathub remote
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

# Install and setup snaps
dnf install snapd
sudo ln -s /var/lib/snapd/snap /snap

# Instal Flat Remix theme + Gnome Tweaks
dnf copr enable daniruiz/flat-remix
dnf install gnome-tweaks flat-remix flat-remix-gnome flat-remix-gtk

# Install VSCode
rpm --import https://packages.microsoft.com/keys/microsoft.asc
sh -c 'echo -e "[code]\nname=Visual Studio Code\nbaseurl=https://packages.microsoft.com/yumrepos/vscode\nenabled=1\ngpgcheck=1\ngpgkey=https://packages.microsoft.com/keys/microsoft.asc" > /etc/yum.repos.d/vscode.repo'
dnf check-update && dnf install code

# Install developer tools for C/C++, Node.js, Java and C#
dnf install gcc gcc-c++ clang autoconf automake cmake
dnf install nodejs
dnf install java-11-openjdk-devel
dnf copr enable @dotnet-sig/dotnet && dnf install dotnet
