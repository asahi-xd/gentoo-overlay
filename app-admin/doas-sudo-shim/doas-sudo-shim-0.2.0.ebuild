# Distributed under the terms of the GNU General Public License v3

EAPI=8

DESCRIPTION="A shim for the sudo command that utilizes doas"
HOMEPAGE="https://github.com/jirutka/doas-sudo-shim"
SRC_URI="https://github.com/jirutka/doas-sudo-shim/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="ISC"
SLOT="0"
KEYWORDS="~amd64"
IUSE="man"

RDEPEND="
    app-admin/doas
    !app-admin/sudo
"
BDEPEND="man? ( dev-ruby/asciidoctor )"

src_compile() {
    use man && emake man
}

src_install() {
    emake DESTDIR="${D}" PREFIX="/usr" install-exec
    use man && emake DESTDIR="${D}" PREFIX="/usr" install-man
}
