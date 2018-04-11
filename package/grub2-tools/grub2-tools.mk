################################################################################
#
# grub2
#
################################################################################

GRUB2_TOOLS_VERSION = 2.02
GRUB2_TOOLS_SITE = $(BR2_GNU_MIRROR)/grub
GRUB2_TOOLS_SOURCE = grub-$(GRUB2_TOOLS_VERSION).tar.xz
GRUB2_TOOLS_LICENSE = GPLv3+
GRUB2_TOOLS_LICENSE_FILES = COPYING
GRUB2_TOOLS_DEPENDENCIES = host-bison host-flex

GRUB2_TOOLS_BUILTIN_MODULES = $(call qstrip,$(BR2_TARGET_GRUB2_BUILTIN_MODULES))
GRUB2_TOOLS_BUILTIN_CONFIG = $(call qstrip,$(BR2_TARGET_GRUB2_BUILTIN_CONFIG))
GRUB2_TOOLS_BOOT_PARTITION = $(call qstrip,$(BR2_TARGET_GRUB2_BOOT_PARTITION))

# Grub2 is kind of special: it considers CC, LD and so on to be the
# tools to build the native tools (i.e to be executed on the build
# machine), and uses TARGET_CC, TARGET_CFLAGS, TARGET_CPPFLAGS,
# TARGET_LDFLAGS to build the bootloader itself. However, to add to
# the confusion, it also uses NM, OBJCOPY and STRIP to build the
# bootloader itself; none of these are used to build the native
# tools.
#
# NOTE: TARGET_STRIP is overridden by BR2_STRIP_none, so always
# use the cross compile variant to ensure grub2 builds

GRUB2_TOOLS_CONF_ENV = \
	$(TARGET_CONFIGURE_OPTS) \
	CPP="$(TARGET_CC) -E" \
	TARGET_CC="$(TARGET_CC)" \
	TARGET_CFLAGS="$(TARGET_CFLAGS)" \
	TARGET_CPPFLAGS="$(TARGET_CPPFLAGS)" \
	TARGET_LDFLAGS="$(TARGET_LDFLAGS)" \
	NM="$(TARGET_NM)" \
	OBJCOPY="$(TARGET_OBJCOPY)" \
	STRIP="$(TARGET_CROSS)strip"

GRUB2_TOOLS_CONF_OPTS = \
	--target=$(GRUB2_TARGET) \
	--with-platform=$(GRUB2_PLATFORM) \
	--disable-grub-mkfont \
	--enable-efiemu=no \
	ac_cv_lib_lzma_lzma_code=no \
	--enable-device-mapper=no \
	--enable-libzfs=no \
	--disable-werror

GRUB2_TOOLS_INSTALL_TARGET_OPTS = DESTDIR=$(TARGET_DIR) install

$(eval $(autotools-package))
