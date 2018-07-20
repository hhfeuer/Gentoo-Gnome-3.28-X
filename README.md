Unofficial Gentoo Gnome 3.28 on Xorg overlay
--------------------------------------------

Versions
--------

 - Gnome 3.28 (stable)

General information
-------------------

 - Does not need the Gnome 3.26 overlay
 - All ebuilds are keyworded amd64
 - Only contains dependencies for and tested with USE="-wayland"
 - Updated games not (yet) included
 - Portions taken from the Heather Gnome overlay
 - ebuilds derived from the 3.22/24 official Gentoo portage ebuilds

Usage
-----

## via local overlays

Create a `/etc/portage/repos.conf/Gnome-3.28-X.conf` file containing

```
[Gnome-3-28-X]
location = /usr/local/portage/Gnome-3-28-X
sync-type = git
sync-uri = https://github.com/hhfeuer/Gentoo-Gnome-3.28-X.git
priority=9999
```

Then run emerge --sync

## via layman

Add via layman:

	layman -o https://raw.github.com/hhfeuer/Gentoo-Gnome-3.28-X/master/repositories.xml -f -a Gnome-3-28-X

Then run layman -s Gnome-3-28-X

Desktop Icons
-------------
As of Version 3.28, nautilus has dropped support for Desktop Icons. To get them back either use package.mask

	>=gnome-base/nautilus-3.28.1
	>=gnome-extra/gnome-user-share-3.28.0

to stay on nautilus-3.26.x or use the experimental gnome-shell plugin at:

	https://gitlab.gnome.org/csoriano/org.gnome.desktop-icons

Another possiblity would be using nemo from the Cinnamon desktop which is a natilus fork.

Quirks
------
gnome-tweak-tool has been renamed to gnome-tweaks, so the ebuild contains a block. You will have to unmerge gnome-tweak-tool prior to upgrading.

needs package.unmask:

	=sys-auth/polkit-0.114
	=app-text/libgepub-0.6.0
	=dev-lang/spidermonkey-52.4.0_pre20171003-r1

needs package.keywords/accept_keywords:

	=media-libs/gegl-0.3.34 ~amd64
	=media-libs/babl-0.1.46 ~amd64
	=sys-power/upower-0.99.7 ~amd64
	=sys-fs/udisks-2.7.6 ~amd64
	=dev-lang/spidermonkey-52.4.0_pre20171003-r1 ~amd64
	=sys-auth/polkit-0.114 ~amd64
	=media-plugins/grilo-plugins-0.3.5 ~amd64

needs package.use:

	dev-libs/folks -tracker
	>=x11-libs/gtksourceview-3.24.7 vala
	>=net-libs/gnome-online-accounts-3.26.2 vala


depending on kernel config might need package.use:

	sys-apps/bubblewrap suid

if portage is complaining about blocks concerning glib and gdbus-codegen, run first:

	emerge -1 glib gdbus-codegen



