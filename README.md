# Don't Starve Together Steam Container

This is a different approach from the other Steam Container for Starbound.
At somepoint, the best of breed should be selected.

One of the design goals of this version is to have eveyrthign stored in a data pod.
The hope was to get steam credentials to cash (Which may not be wise on widely accessable servers).

Rather than include control scripts in the Dockerfile they are not in a folder and copied over.

## Helpful Sites
[List of Steam App IDs](https://developer.valvesoftware.com/wiki/Dedicated_Servers_List)

[Steam CMD Setup Instructions](https://developer.valvesoftware.com/wiki/SteamCMD#Docker)

## Install Prerequisites

### Setup Basic System

#### Install Operating System
This setup requires Ubuntu 20.10 (podman is now part of the main package repos)

#### Install Basic Packages
Remove
* vim-tiny - No idea why this is the default in ubuntu

Install
* htop - Used to monitor system performance
* git - Version Control
* vim - Text Editor
* openssh-server - Used for remote access to server base
* podman - Used to manage containers (preffered over docker)
* buildah - Used to build containers (preffered over docker)
* runc - Required by podman & buildah but not listed as a dependency in 20.10

```bash
$ sudo apt remove vim-tiny
$ sudo apy update
$ sudo apy install htop git vim openssh-server podman buildah runc
```

Move Github public/private keys to ~/.ssh/
And either notify that the key is there or makesure it is named id_ed

## SteamCMD Base

Below is the setupfor a starbound based config.
Change the poddata-<game> as needed for other games.

See special notes for other games.

```bash
mkdir -p <desired-path>/poddata-starbound
chmod 777 <desired-path>/poddata-starbound
podman run -d --net=host --name=starbound-container1 -v <desired-path>/poddata-starbound:/home/steam/poddata starbound-container
```

* ```-d``` Tells podman to detach (run in background)
* ```--net=host``` Tells pod to use the host computers network stack
* ```--name=steam-starbound``` Tells pod to use the name "steam-starbound"
* ```-v <host-path-to-storage>:<mount-point-in-container>``` Teslls the coontainer to use persistant storage

## Host Computer Commands
To Build the container (After updating the Dockerfile)
```bash
source build.sourceme

To start the container to run in the background
```bash
source start.sourceme
```

To Stop the container
```bash
source stop.sourceme
```
To Install (first time) or Run Updates
```bash
source interactive.sourceme
./install.sh # or ./update.sh
```

## Don't Starve Together
NOT IMPLEMENTED YET


Setup insructions based on:
https://steamcommunity.com/sharedfiles/filedetails/?id=590565473

Older Reference but some context can be helpful
https://dontstarve.fandom.com/wiki/Guides/Don%E2%80%99t_Starve_Together_Dedicated_Servers#Running

How to enable console
https://dontstarve.fandom.com/wiki/Console



Use the following to make the server stop when everyone logs off
```
pause_when_empty = true
```
