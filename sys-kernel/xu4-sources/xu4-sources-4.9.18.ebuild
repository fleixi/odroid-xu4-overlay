# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI="5"
K_NOUSENAME="yes"
K_NOSETEXTRAVERSION="yes"
K_SECURITY_UNSUPPORTED="1"
ETYPE="sources"
inherit kernel-2
inherit git-2
detect_version

DESCRIPTION="Full sources for the Linux kernel for the Odroid XU4"
HOMEPAGE="https://github.com/mihailescu2m/linux"
EGIT_REPO_URI="git://github.com/mihailescu2m/linux"
EGIT_BRANCH="odroidxu3-4.9.y"
SRC_URI=""

KEYWORDS="~arm"
