# Inherit AOSP device configuration for supersonic.
$(call inherit-product, device/htc/supersonic/device_supersonic.mk)

# Inherit some CDMA stuff.
$(call inherit-product, vendor/omni/config/cdma.mk)

#
# Setup device specific product configuration.
#
PRODUCT_NAME := omni_supersonic
PRODUCT_BRAND := Sprint
PRODUCT_DEVICE := supersonic
PRODUCT_MODEL := PC36100
PRODUCT_MANUFACTURER := HTC

