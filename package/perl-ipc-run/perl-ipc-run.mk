################################################################################
#
# perl-ipc-run
#
################################################################################

PERL_IPC_RUN_VERSION = 0.96
PERL_IPC_RUN_SOURCE = IPC-Run-$(PERL_IPC_RUN_VERSION).tar.gz
PERL_IPC_RUN_SITE = $(BR2_CPAN_MIRROR)/authors/id/T/TO/TODDR
PERL_IPC_RUN_DEPENDENCIES = 
PERL_IPC_RUN_LICENSE_FILE = COPYING

$(eval $(perl-package))
