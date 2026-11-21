# SPDX-License-Identifier: Apache-2.0

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYPI_VERIFY_REPO=https://github.com/onekey-sec/arpy
PYTHON_COMPAT=( python3_{10..15} python3_{13..15}t pypy3 pypy3_11 )

inherit distutils-r1 pypi

DESCRIPTION="Python library for accessing ar files"
HOMEPAGE="
	https://github.com/onekey-sec/arpy/
	https://pypi.org/project/arpy/
"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~arm64 ~riscv"
RESTRICT="test"  # Upstream sdist missing fixtures and __init__.py for test/

EPYTEST_PLUGINS=()
distutils_enable_tests pytest

python_prepare_all() {
	distutils-r1_python_prepare_all

	# We don't need pytest-cov
	sed -i -E -e 's/ ?--cov[a-z-]*(=[a-z0-9]+)?//g' pyproject.toml || die
}
