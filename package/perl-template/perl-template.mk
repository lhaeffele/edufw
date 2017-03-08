################################################################################
#
# perl-template
#
################################################################################

PERL_TEMPLATE_VERSION = 2.26
PERL_TEMPLATE_SOURCE = Template-Toolkit-$(PERL_TEMPLATE_VERSION).tar.gz
PERL_TEMPLATE_SITE = $(BR2_CPAN_MIRROR)/authors/id/A/AB/ABW
PERL_TEMPLATE_DEPENDENCIES = 
PERL_TEMPLATE_LICENSE_FILE = COPYING
PERL_TEMPLATE_CONF_OPTS = TT_XS_ENABLE=n

$(eval $(perl-package))
