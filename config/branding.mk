# Boot animation
ifneq ($(filter 720p 1080p 1440p hvga qhd wvga xga,$(BOOT_ANIMATION_SIZE)),)
PRODUCT_COPY_FILES += \
    $(SRC_EVERVOLV_DIR)/prebuilt/bootanimation/$(BOOT_ANIMATION_SIZE).zip:$(TARGET_COPY_OUT_SYSTEM)/media/bootanimation.zip
endif

# SDK
EV_PLATFORM_SDK_VERSION ?= 4
EV_PLATFORM_REV ?= 0

PRODUCT_PACKAGES += \
    com.evervolv.globalactions.xml \
    com.evervolv.hardware.xml \
    com.evervolv.livedisplay.xml \
    com.evervolv.performance.xml \
    com.evervolv.platform-res \
    com.evervolv.platform \
    com.evervolv.platform.xml \
    EVSettingsProvider \
    EVToolbox \
    EVUpdater

# Version Info
EV_VERSION_MAJOR = 12
EV_VERSION_MINOR = 0
EV_VERSION_MAINTENANCE = 0

ifeq ($(EV_VERSION),)
EV_VERSION := $(EV_VERSION_MAJOR)
ifneq ($(EV_VERSION_MINOR),0)
EV_VERSION := $(EV_VERSION_MAJOR).$(EV_VERSION_MINOR)
ifneq ($(EV_VERSION_MINOR),0)
EV_VERSION := $(EV_VERSION_MAJOR).$(EV_VERSION_MINOR).$(EV_VERSION_MAINTENANCE)
endif
endif
endif

ifneq ($(filter nightly testing release,$(PRODUCT_BUILD)),)
EV_BUILD_TYPE := $(PRODUCT_BUILD)
else
EV_BUILD_TYPE := userbuild
endif

EV_PACKAGE_NAME := $(TARGET_PRODUCT)-$(EV_VERSION)-$(EV_BUILD_TYPE)-$(shell date +%Y.%m.%d)-$(shell date -u +%H%M)
TARGET_OTA_PACKAGE_NAME := $(shell echo ${EV_PACKAGE_NAME} | tr [:upper:] [:lower:])
