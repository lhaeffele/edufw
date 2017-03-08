################################################################################
#
# perl-yaml
#
################################################################################

PERL_YAML_VERSION = 1.23
PERL_YAML_SOURCE = YAML-$(PERL_YAML_VERSION).tar.gz
PERL_YAML_SITE = $(BR2_CPAN_MIRROR)/authors/id/I/IN/INGY
PERL_YAML_DEPENDENCIES = 
PERL_YAML_LICENSE_FILE = COPYING

$(eval $(perl-package))
