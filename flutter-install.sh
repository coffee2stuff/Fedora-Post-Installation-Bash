# This script assumes that you have snapd installed on
# your system.

sudo snap install flutter --classic
flutter
flutter doctor

# Enable web support
flutter channel beta
flutter upgrade
flutter config --enable-web