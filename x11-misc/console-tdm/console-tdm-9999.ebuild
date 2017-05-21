EAPI=5

inherit multilib git-r3

EGIT_REPO_URI="https://github.com/dopsi/console-tdm"

DESCRIPTION="The TDM display manager is a wrapper script for startx and/or wayland"
HOMEPAGE="https://github.com/dopsi/console-tdm"

SLOT="0"
KEYWORDS="~arm"
IUSE=""

RDEPEND="x11-apps/xinit dev-util/dialog"

src_prepare() {
	einfo "Nothing to patch"
}

src_compile() {
	einfo "Nothing to compile"
}

src_install() {
	emake DESTDIR="${D}" install
}

pkg_postinst() {
	elog "To install tdm for your local user, run"
	elog
	elog "tdmctl init tdmctl add [X(default)/extra]"
	elog
	elog "This will copy the tdm configuration directory to your home directory."
	elog
	elog "You must then edit your .profile (or .bash_profile, .zprofile, etc...) file"
	elog "to call tdm as last command (this will launch tdm once you log into a tty)."
	elog
	elog "In your .xinitrc file, you must then replace the exec line with exec tdm --xstart,"
	elog "which will start your X session (if you do not have a .xinitrc file, create a new one with this line in it)."
}

pkg_postrm() {
        elog "Please remember to edit your .profile (or .bash_profile, .zprofile, etc...) file"
        elog "to remove call tdm as last command."
        elog
        elog "Also remeber in your .xinitrc file, you must then replace the exec tdm --xstart line with exec <otherManager>."
}
