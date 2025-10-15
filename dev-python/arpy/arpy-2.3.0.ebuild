# SPDX-License-Identifier: Apache-2.0

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{10..14} python3_{13..14}t pypy3 )

inherit distutils-r1 pypi

DESCRIPTION="Python library for accessing ar files"
HOMEPAGE="
	https://github.com/viraptor/arpy/
	https://pypi.org/project/arpy/
"

LICENSE="BSD"
SLOT="0"
KEYWORDS="amd64 ~arm64 ~riscv"

distutils_enable_tests unittest

python_test() {
	eunittest test
}
