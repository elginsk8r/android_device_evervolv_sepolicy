COMMON_EVERVOLV_SEPOLICY := device/evervolv/sepolicy/common

ifeq ($(TARGET_COPY_OUT_VENDOR), vendor)
ifeq ($(BOARD_VENDORIMAGE_FILE_SYSTEM_TYPE),)
TARGET_USES_PREBUILT_VENDOR_SEPOLICY ?= true
endif
endif

SYSTEM_EXT_PUBLIC_SEPOLICY_DIRS += \
    $(COMMON_EVERVOLV_SEPOLICY)/public

SYSTEM_EXT_PRIVATE_SEPOLICY_DIRS += \
    $(COMMON_EVERVOLV_SEPOLICY)/private

ifeq ($(TARGET_USES_PREBUILT_VENDOR_SEPOLICY), true)
SYSTEM_EXT_PRIVATE_SEPOLICY_DIRS += \
    $(COMMON_EVERVOLV_SEPOLICY)/dynamic
else
BOARD_VENDOR_SEPOLICY_DIRS += \
    $(COMMON_EVERVOLV_SEPOLICY)/dynamic \
    $(COMMON_EVERVOLV_SEPOLICY)/vendor
endif

# Include atv rules on atv product
ifeq ($(PRODUCT_IS_ATV), true)
include device/evervolv/sepolicy/atv/sepolicy.mk
endif
