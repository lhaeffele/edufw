################################################################################
#
# perl-switch
#
################################################################################

PERL_SWITCH_VERSION = 2.17
PERL_SWITCH_SOURCE = Switch-$(PERL_SWITCH_VERSION).tar.gz
PERL_SWITCH_SITE = $(BR2_CPAN_MIRROR)/authors/id/C/CH/CHORNY
PERL_SWITCH_DEPENDENCIES = 
PERL_SWITCH_LICENSE_FILE = COPYING

$(eval $(perl-package))
