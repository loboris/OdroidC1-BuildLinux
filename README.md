Ubuntu/Debian installation for Odroid-C1
========================================

**Overview:**

- makes complete Odroid-C1 SDCard image ready to be copied to SDCard
- tested distributions: Ubuntu precise&trusty&utopic&vivid, Debian wheezy&jessie
- installs basic debootstrap installation & some essential additional packages
- automatic installation without user intervention needed
- automatic creation of user account and user password
- automatic localization (same as host or specified)
- network works, ssh server installed
- filesystem size less then 500 MB
- initial RAM usage less then 40 MB
- tricks to enable serial console, framebuffer console
- using tmux (started automatically on logon) to provide cursor in framebuffer console
- full desktop (**LXDE/LUBUNTU/MATE**) can be installed later (scripts included)

**Options:**

- create image without fat partition, boot from ext4 partition
- create btrfs formated filesystem with compression enabled
- boot.ini has option to disable video and free more than 100MB of RAM, frame buffer is still usable (uses only 24MB RAM) (thanks tobetter)
- xz compress image after creation and create md5summ
- create filesystem in local directory, create image later using image_from_dir script

**Tips:**

- uses Hardkernel's repository for kernel update
- to resize partition to fit SDCard run: `sudo fs_resize`
- you can use "format_sdcard" script to format sd card for Odroid Linux.
- you can use "image_from_dir" script to create the image file from installation in local folder.
- you can use "backup_sdcard" script to backup sdcard to local folder.
- you can use "restore_sdcard" script to restore sdcard from backup folder.
- Edit rc-local to set cpu frequency to 1.728 GHz

