# Inherit AOSP device configuration for supersonic.
$(call inherit-product, device/htc/supersonic/full_supersonic.mk)

# Inherit some common evervolv stuff.
$(call inherit-product, vendor/ev/config/common_full_phone.mk)

#
# Setup device specific product configuration.
#
PRODUCT_NAME := ev_supersonic
PRODUCT_BRAND := sprint
PRODUCT_DEVICE := supersonic
PRODUCT_MODEL := PC36100
PRODUCT_MANUFACTURER := HTC
PRODUCT_BUILD_PROP_OVERRIDES += BUILD_ID=GRI40 PRODUCT_NAME=htc_supersonic BUILD_FINGERPRINT=sprint/htc_supersonic/supersonic:2.3.3/GRI40/61076:user/release-keys PRIVATE_BUILD_DESC="4.24.651.1 CL61076 release-keys"

# Set up the product codename, build version & MOTD.
PRODUCT_CODENAME := Acies

PRODUCT_MOTD :="\n\n\n--------------------MESSAGE---------------------\nThank you for choosing Evervolv for your Evo 4G\nPlease visit us at \#evervolv on irc.freenode.net\nFollow @preludedrew for the latest Evervolv updates\nGet the latest rom at evervolv.com\n------------------------------------------------\n"

ifeq ($(NIGHTLY_BUILD),true)
    BUILD_VERSION := 2.0.0p4-$(shell date +%m%d%Y)-NIGHTLY
else
    BUILD_VERSION := 2.0.0p4
endif

PRODUCT_PROPERTY_OVERRIDES += \
    ro.build.romversion=Evervolv-$(PRODUCT_CODENAME)-$(BUILD_VERSION)

# Extra RIL settings
PRODUCT_PROPERTY_OVERRIDES += \
    ro.ril.enable.managed.roaming=1 \
    ro.ril.oem.nosim.ecclist=911,112,999,000,08,118,120,122,110,119,995 \
    ro.ril.emc.mode=2

PRODUCT_PACKAGES += \
    Camera

#Temp packages -- let's put this into it's own make file in the vendor config.
PRODUCT_PACKAGES += \
    bash vim nano libncurses ssh rsync \
    Stk \
    e2fsck resize2fs e2fsck \
    libext2_com_err libext2_profile libext2_blkid libext2_e2p libext2_uuid libext2fs

#Get eng stuff on our userdebug builds
# Turn on checkjni for non-user builds.
ADDITIONAL_BUILD_PROPERTIES += ro.kernel.android.checkjni=1
# Set device insecure for non-user builds.
ADDITIONAL_DEFAULT_PROPERTIES += ro.secure=0
# Allow mock locations by default for non user builds
ADDITIONAL_DEFAULT_PROPERTIES += ro.allow.mock.location=1

# USB
#ADDITIONAL_DEFAULT_PROPERTIES += persist.sys.usb.config=mass_storage,adb
#ADDITIONAL_DEFAULT_PROPERTIES += persist.sys.usb.config=mtp,adb