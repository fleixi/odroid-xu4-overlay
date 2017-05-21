# Copyright 2015 Daniel 'herrnst' Scheller, Team Kodi
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

EGIT_REPO_URI="https://github.com/kodi-pvr/pvr.hts.git"
EGIT_BRANCH="master"
EGIT_COMMIT="0e0cd45f9da447c131003a4164623ee49f117eb2"
inherit git-r3 cmake-utils kodi-addon

DESCRIPTION="Kodi's Tvheadend HTSP client addon"
HOMEPAGE="http://kodi.tv"
SRC_URI=""

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~arm"
IUSE=""

DEPEND="
	media-tv/kodi
	media-libs/kodiplatform
	"

