# Intro and Setup

## Linux Distribution

A Linux Distribution is an Operating System made from a software collection that is based
upon the Linux kernel and, often, a package management system.
The Linux OS comprises:
- the Linux Kernel
- the GNU shell utilities
- the graphical desktop environment and more

Most used Linux Distribution:
- Ubuntu (will be used in this course, but what we will learn will be linux distribution independent)
- Redhat

[Linux Distribution Database](https://distrowatch.com/) 

## Setup

Setup [Vbox](https://www.virtualbox.org/) with [Ubuntu LTS Version](https://ubuntu.com/download/desktop)

### Updating package
- `sudo apt update` : updates the package lists for upgrades for packages that need upgrading, as well as new packages that have just come to the repositories.
- `sudo apt full-upgrade` : update applications to the latest versions

### Device Integration
- Devices -> Insert Guest Additions CD Image
- If that doesnt work, go to terminal
  - `cd /media/<username>/Vbox_GA_…`
  - `sudo bash VBoxLinuxAddtions.run`

### Snapshots
Can restore the snapshots using the Virtualbox when the VM is on saved or powered off state. 
Very useful to do so can rollback anytime, especially when making huge changes to your VM
- Machine -> Take Snapshots
