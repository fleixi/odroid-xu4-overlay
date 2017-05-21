EAPI=5

inherit multilib git-r3

EGIT_REPO_URI="https://github.com/fleixi/xu4_mali.git"

DESCRIPTION="Closed source Mali 3d binary blobs for Wayland"
HOMEPAGE="https://github.com/fleixi/xu4_mali"

SLOT="0"
KEYWORDS="~arm"
IUSE=""

DEPEND=">=app-eselect/eselect-opengl-1.2.6"
RDEPEND="${DEPEND} media-libs/mesa[egl,gles1,gles2]"

S="${WORKDIR}/${P}/wayland"

src_prepare() {
	einfo "Nothing to patch"
}

src_compile() {
	einfo "Nothing to compile"
}

src_install() {
	# udev rules to get the right ownership/permission for /dev/mali
	insinto /lib/udev/rules.d
	doins "${FILESDIR}"/99-mali-drivers.rules

	dodir /usr/lib/opengl/mali
	dodir /usr/lib/pkgconfig
	dodir /usr/include
	emake DESTDIR="${D}" install
}

pkg_postinst() {
	elog "You must be in the video group to use the Mali 3D acceleration."
	elog
	elog "To use the Mali OpenGL ES libraries, run \"eselect opengl set --ignore-missing mali\""
}

pkg_prerm() {
	"${ROOT}"/usr/bin/eselect opengl set --use-old --ignore-missing xorg-x11
}

pkg_postrm() {
	"${ROOT}"/usr/bin/eselect opengl set --use-old --ignore-missing xorg-x11
}

