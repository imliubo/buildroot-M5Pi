################################################################################
#
# ESP8089-SPI
#
################################################################################

ESP8089_SPI_VERSION = master
ESP8089_SPI_SITE = $(call github,notabucketofspam,ESP8089-SPI,$(ESP8089_SPI_VERSION))

ESP8089_SPI_MODULE_MAKE_OPTS = KVERSION=$(LINUX_VERSION)
ESP8089_SPI_MODULE_MAKE_OPTS += KBUILD=$(LINUX_DIR)

$(eval $(kernel-module))

define ESP8089_SPI_POST_INSTALL_KERNEL_MODULE
	mkdir -p $(TARGET_DIR)/lib/modules/$(LINUX_VERSION)/kernel/drivers/staging/esp8089
	$(INSTALL) -D -m 644 $(@D)/esp8089-spi.ko \
	$(TARGET_DIR)/lib/modules/$(LINUX_VERSION)/kernel/drivers/staging/esp8089
	echo "kernel/drivers/staging/esp8089/esp8089_spi.ko:" > $(TARGET_DIR)/lib/modules/$(LINUX_VERSION)/modules.dep
endef
# sort -u $(TARGET_DIR)/lib/modules/$(LINUX_VERSION)/modules.dep

ESP8089_SPI_POST_INSTALL_TARGET_HOOKS += ESP8089_SPI_POST_INSTALL_KERNEL_MODULE

$(eval $(generic-package))
