################################################################################
#
# perl-anyevent
#
################################################################################

PERL_ANYEVENT_VERSION = 7.13
PERL_ANYEVENT_SOURCE = AnyEvent-$(PERL_ANYEVENT_VERSION).tar.gz
PERL_ANYEVENT_SITE = $(BR2_CPAN_MIRROR)/authors/id/M/ML/MLEHMANN
PERL_ANYEVENT_DEPENDENCIES = host-perl-canary-stability perl-net-ssleay
PERL_ANYEVENT_LICENSE_FILE = COPYING

$(eval $(perl-package))
