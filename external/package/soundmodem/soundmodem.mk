################################################################################
#
# soundmodem
#
#################################################################################

SOUNDMODEM_VERSION = 0.20
SOUNDMODEM_SOURCE = soundmodem-$(SOUNDMODEM_VERSION).tar.gz
SOUNDMODEM_SITE = https://archive.org/download/soundmodem-$(SOUNDMODEM_VERSION)
SOUNDMODEM_LICENSE = GPL-2.0+
SOUNDMODEM_LICENSE_FILES = COPYING
SOUNDMODEM_INSTALL_STAGING = NO
SOUNDMODEM_INSTALL_TARGET = YES
SOUNDMODEM_AUTORECONF = YES
SOUNDMODEM_GETTEXTIZE = YES
SOUNDMODEM_DEPENDENCIES = alsa-lib audiofile libxml2

define SOUNDMODEM_INSTALL_INIT_SYSV
	$(INSTALL) -m 0755 -D $(SOUNDMODEM_PKGDIR)/S50soundmodem \
				$(TARGET_DIR)/etc/init.d/S50soundmodem
endef

define SOUNDMODEM_INSTALL_CONFIG
	$(INSTALL) -m 0644 -D $(SOUNDMODEM_PKGDIR)/soundmodem.conf \
				$(TARGET_DIR)/etc/ax25/soundmodem.conf
endef

SOUNDMODEM_POST_INSTALL_TARGET_HOOKS += SOUNDMODEM_INSTALL_CONFIG

$(eval $(autotools-package))
