#
# Copyright (C) 2009 The Android Open Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

#
# This is the product configuration for a generic supersonic,
# not specialized for any geography.
#

PRODUCT_COPY_FILES += \
    device/htc/supersonic/prebuilt/root/init.supersonic.rc:root/init.supersonic.rc \
    device/htc/supersonic/prebuilt/root/init.supersonic.usb.rc:root/init.supersonic.usb.rc \
    device/htc/supersonic/prebuilt/root/ueventd.supersonic.rc:root/ueventd.supersonic.rc \
    device/htc/supersonic/prebuilt/root/fstab.supersonic:root/fstab.supersonic \
    device/htc/supersonic/prebuilt/root/init.recovery.supersonic.rc:root/init.recovery.supersonic.rc \

$(call inherit-product-if-exists, vendor/htc/supersonic/supersonic-vendor.mk)

# Recovery
PRODUCT_PACKAGES += \
    chargeled

LOCAL_PATH := device/htc/supersonic
ifeq ($(TARGET_PREBUILT_KERNEL),)
	LOCAL_KERNEL := $(LOCAL_PATH)/kernel
else
	LOCAL_KERNEL := $(TARGET_PREBUILT_KERNEL)
endif

PRODUCT_COPY_FILES += \
    $(LOCAL_KERNEL):kernel

$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)

PRODUCT_NAME := htc_supersonic
PRODUCT_DEVICE := supersonic
PRODUCT_MODEL := PC36100
