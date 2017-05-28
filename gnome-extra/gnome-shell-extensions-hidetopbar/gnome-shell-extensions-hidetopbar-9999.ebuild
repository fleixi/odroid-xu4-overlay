# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6
inherit git-r3

DESCRIPTION="hide topbar if not focused"
HOMEPAGE="https://extensions.gnome.org/extension/545/hide-top-bar/"
EGIT_REPO_URI="https://github.com/mlutfy/hidetopbar"

LICENSE="GPL-2+"
SLOT="0"
KEYWORDS="amd64 x86 arm"
IUSE=""

# glib for glib-compile-schemas at build time, needed at runtime anyways
COMMON_DEPEND="
	dev-libs/glib:2
"
RDEPEND="${COMMON_DEPEND}
	app-eselect/eselect-gnome-shell-extensions
	>=gnome-base/gnome-shell-3.16
"
DEPEND="${COMMON_DEPEND}"

src_prepare() {
        eapply "${FILESDIR}"/add_install_to_makefile.patch
	eapply_user
}

#src_compile() {
	# It redoes this with "make install" later due to a dumb Makefile, so don't bother
#}

src_install() {
	# TODO: Figure out if we can get the schemas to standard location, in a way that works properly runtime too
	make install INSTALL_PATH="${ED}usr/share/gnome-shell/extensions/"
	rm "${ED}/usr/share/gnome-shell/extensions/hidetopbar@mathieu.bidon.ca/README.md" || die
	dodoc README.md
}

pkg_postinst() {
	ebegin "Updating list of installed extensions"
	eselect gnome-shell-extensions update
	eend $?
}
