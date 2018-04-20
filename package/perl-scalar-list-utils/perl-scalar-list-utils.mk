################################################################################
#
# perl-scalar-list-utils
#
################################################################################

PERL_SCALAR_LIST_UTILS_VERSION = 1.50
PERL_SCALAR_LIST_UTILS_SOURCE = Scalar-List-Utils-$(PERL_SCALAR_LIST_UTILS_VERSION).tar.gz
PERL_SCALAR_LIST_UTILS_SITE = $(BR2_CPAN_MIRROR)/authors/id/P/PE/PEVANS
PERL_SCALAR_LIST_UTILS_DEPENDENCIES = 
PERL_SCALAR_LIST_UTILS_LICENSE_FILE = COPYING
PERL_SCALAR_LIST_UTILS_CONF_OPTS =

$(eval $(perl-package))
