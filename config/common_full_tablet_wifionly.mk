$(call inherit-product, $(SRC_TARGET_DIR)/product/window_extensions.mk)

# Inherit common stuff
$(call inherit-product, $(SRC_EVERVOLV_DIR)/config/common_full.mk)

# Permissions
PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
    ro.control_privapp_permissions=enforce

# Sound
include $(SRC_EVERVOLV_DIR)/config/aosp_audio.mk
