#
# This policy configuration will be used by atv products that
# inherit from Lineage
#

ATV_EVERVOLV_SEPOLICY := device/evervolv/sepolicy/atv

ifneq ($(TARGET_USES_PREBUILT_VENDOR_SEPOLICY), true)
BOARD_SEPOLICY_DIRS += \
    $(ATV_EVERVOLV_SEPOLICY)/vendor
endif
