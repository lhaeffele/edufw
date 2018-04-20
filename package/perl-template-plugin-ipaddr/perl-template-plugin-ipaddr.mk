################################################################################
#
# perl-template-plugin-ipaddr
#
################################################################################

PERL_TEMPLATE_PLUGIN_IPADDR_VERSION = 0.03
PERL_TEMPLATE_PLUGIN_IPADDR_SOURCE = Template-Plugin-IPAddr-$(PERL_TEMPLATE_PLUGIN_IPADDR_VERSION).tar.gz
PERL_TEMPLATE_PLUGIN_IPADDR_SITE = $(BR2_CPAN_MIRROR)/authors/id/P/PE/PELLE
PERL_TEMPLATE_PLUGIN_IPADDR_DEPENDENCIES = perl-netaddr-ip perl-scalar-list-utils
PERL_TEMPLATE_PLUGIN_IPADDR_LICENSE_FILE = COPYING
PERL_TEMPLATE_PLUGIN_IPADDR_CONF_OPTS =

$(eval $(perl-package))
