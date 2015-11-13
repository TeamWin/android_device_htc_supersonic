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
# This file sets variables that control the way modules are built
# thorughout the system. It should not be used to conditionally
# disable makefiles (the proper mechanism to control what gets
# included in a build is to use PRODUCT_PACKAGES in a product
# definition file).
#

# WARNING: This line must come *before* including the proprietary
# variant, so that it gets overwritten by the parent (which goes
# against the traditional rules of inheritance).

# Arm (v7a) w/ neon
TARGET_ARCH := arm
TARGET_ARCH_VARIANT := armv7-a-neon
TARGET_CPU_ABI := armeabi-v7a
TARGET_CPU_ABI2 := armeabi
TARGET_CPU_VARIANT := cortex-a8

TARGET_BOOTLOADER_BOARD_NAME := supersonic

# Kernel
BOARD_CUSTOM_BOOTIMG_MK := device/htc/supersonic/custombootimg.mk
BOARD_KERNEL_CMDLINE := no_console_suspend=1 androidboot.selinux=permissive
BOARD_KERNEL_BASE := 0x20000000
BOARD_KERNEL_NEW_PPPOX := true
TARGET_PREBUILT_KERNEL := device/htc/supersonic/kernel

# USB
TARGET_USE_CUSTOM_LUN_FILE_PATH := /sys/devices/platform/usb_mass_storage/lun%d/file

# # cat /proc/mtd
# dev:    size   erasesize  name
# mtd0: 00c00000 00020000 "wimax"
# mtd1: 000a0000 00020000 "misc"
# mtd2: 00480000 00020000 "recovery"
# mtd3: 00300000 00020000 "boot"
# mtd4: 15e00000 00020000 "system"
# mtd5: 0a000000 00020000 "cache"
# mtd6: 1aba0000 00020000 "userdata"
BOARD_BOOTIMAGE_PARTITION_SIZE := 3145728
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 4718592
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 367001600   # limited so we enforce room to grow
BOARD_USERDATAIMAGE_PARTITION_SIZE := 448397312

BOARD_FLASH_BLOCK_SIZE := 131072

# TWRP specific build flags
TW_THEME := portrait_mdpi
TW_BRIGHTNESS_PATH := /sys/class/leds/lcd-backlight/brightness
TW_EXCLUDE_DEFAULT_USB_INIT := true
TW_EXCLUDE_ENCRYPTED_BACKUPS := true
TW_EXCLUDE_SUPERSU := true
TW_EXCLUDE_MTP := true
TW_NO_CPU_TEMP := true
TW_NO_EXFAT_FUSE := true
