# Copyright 2015 Daniel 'herrnst' Scheller, Team Kodi
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

EGIT_REPO_URI="https://github.com/kodi-pvr/pvr.hts.git"
EGIT_BRANCH="master"
EGIT_COMMIT="4188daa899a3c7ca697bfb2b614a86a1bf74f542"
inherit git-r3 cmake-utils kodi-addon

DESCRIPTION="Kodi's Tvheadend HTSP client addon"
HOMEPAGE="http://kodi.tv"
SRC_URI=""
RESTRICT="strip"
LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~arm"
IUSE=""

DEPEND="
	media-tv/kodi
	media-libs/kodiplatform
	"

