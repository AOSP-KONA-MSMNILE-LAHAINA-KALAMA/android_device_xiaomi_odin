#
# Copyright (C) 2022 Project 404
# Copyright (C) 2024 Paranoid Android
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

DEVICE_PATH := device/xiaomi/odin

BUILD_BROKEN_DUP_RULES := true
BUILD_BROKEN_ELF_PREBUILT_PRODUCT_COPY_FILES := true
BUILD_BROKEN_USES_BUILD_COPY_HEADERS := true

# A/B
AB_OTA_UPDATER := true

AB_OTA_PARTITIONS += \
    boot \
    dtbo \
    odm \
    product \
    system \
    system_ext \
    vbmeta \
    vbmeta_system \
    vendor \
    vendor_dlkm \
    vendor_boot

# Architecture
TARGET_ARCH := arm64
TARGET_ARCH_VARIANT := armv8-2a-dotprod
TARGET_CPU_ABI := arm64-v8a
TARGET_CPU_ABI2 :=
TARGET_CPU_VARIANT := cortex-a76

TARGET_2ND_ARCH := arm
TARGET_2ND_ARCH_VARIANT := armv8-2a
TARGET_2ND_CPU_ABI := armeabi-v7a
TARGET_2ND_CPU_ABI2 := armeabi
TARGET_2ND_CPU_VARIANT := cortex-a76

# Audio
AUDIO_FEATURE_ENABLED_EXTENDED_COMPRESS_FORMAT := true
AUDIO_FEATURE_ENABLED_GKI := true
BOARD_SUPPORTS_SOUND_TRIGGER := true

# Bootloader
TARGET_BOOTLOADER_BOARD_NAME := odin
TARGET_NO_BOOTLOADER := true

# Camera
TARGET_USES_QTI_CAMERA_DEVICE := true

# Display
SOONG_CONFIG_NAMESPACES += dolby_vision
SOONG_CONFIG_dolby_vision += enabled
SOONG_CONFIG_dolby_vision_enabled := true

TARGET_SCREEN_DENSITY := 560

# Filesystem
TARGET_FS_CONFIG_GEN := $(DEVICE_PATH)/config.fs

# GPS
BOARD_VENDOR_QCOM_GPS_LOC_API_HARDWARE := default
LOC_HIDL_VERSION := 4.0

# HIDL
DEVICE_MATRIX_FILE := device/qcom/common/compatibility_matrix.xml

DEVICE_FRAMEWORK_COMPATIBILITY_MATRIX_FILE += \
    $(DEVICE_PATH)/configs/vintf/vendor_framework_compatibility_matrix.xml \
    vendor/qcom/opensource/core-utils/vendor_framework_compatibility_matrix.xml

DEVICE_MANIFEST_FILE := \
    $(DEVICE_PATH)/configs/vintf/manifest.xml

# Include proprietary files
-include vendor/xiaomi/odin/BoardConfigVendor.mk

# Kernel
BOARD_KERNEL_BASE := 0x00000000
BOARD_KERNEL_IMAGE_NAME := Image
BOARD_KERNEL_PAGESIZE := 4096
BOARD_KERNEL_SEPARATED_DTBO := true
BOARD_RAMDISK_USE_LZ4 := true
KERNEL_LD := LD=ld.lld
KERNEL_FULL_LLVM := true

BOARD_BOOT_HEADER_VERSION := 4
BOARD_MKBOOTIMG_ARGS += --header_version $(BOARD_BOOT_HEADER_VERSION)

TARGET_KERNEL_ADDITIONAL_FLAGS := DTC_EXT=$(shell pwd)/prebuilts/misc/linux-x86/dtc/dtc
KERNEL_DEFCONFIG := vendor/lahaina-qgki_defconfig

BOARD_KERNEL_CMDLINE += androidboot.console=ttyMSM0
BOARD_KERNEL_CMDLINE += androidboot.hardware=qcom
BOARD_KERNEL_CMDLINE += androidboot.usbcontroller=a600000.dwc3
BOARD_KERNEL_CMDLINE += cgroup.memory=nokmem,nosocket
BOARD_KERNEL_CMDLINE += console=ttyMSM0,115200n8
BOARD_KERNEL_CMDLINE += loop.max_part=7
BOARD_KERNEL_CMDLINE += msm_rtb.filter=0x237
BOARD_KERNEL_CMDLINE += service_locator.enable=1
BOARD_KERNEL_CMDLINE += swiotlb=0
BOARD_KERNEL_CMDLINE += kpti=off
BOARD_KERNEL_CMDLINE += pcie_ports=compat
BOARD_KERNEL_CMDLINE += iptable_raw.raw_before_defrag=1
BOARD_KERNEL_CMDLINE += ip6table_raw.raw_before_defrag=1

# Kernel modules
BOOT_KERNEL_MODULES := \
    hwid.ko

BOARD_VENDOR_RAMDISK_RECOVERY_KERNEL_MODULES_LOAD := $(BOOT_KERNEL_MODULES)

BOARD_VENDOR_KERNEL_MODULES := \
    $(KERNEL_MODULES_OUT)/adsp_loader_dlkm.ko \
    $(KERNEL_MODULES_OUT)/apr_dlkm.ko \
    $(KERNEL_MODULES_OUT)/bolero_cdc_dlkm.ko \
    $(KERNEL_MODULES_OUT)/bt_fm_slim.ko \
    $(KERNEL_MODULES_OUT)/btpower.ko \
    $(KERNEL_MODULES_OUT)/camera.ko \
    $(KERNEL_MODULES_OUT)/cnss2.ko \
    $(KERNEL_MODULES_OUT)/cyttsp5.ko \
    $(KERNEL_MODULES_OUT)/cyttsp5_device_access.ko \
    $(KERNEL_MODULES_OUT)/cyttsp5_i2c.ko \
    $(KERNEL_MODULES_OUT)/cyttsp5_loader.ko \
    $(KERNEL_MODULES_OUT)/device_management_service_v01.ko \
    $(KERNEL_MODULES_OUT)/e4000.ko \
    $(KERNEL_MODULES_OUT)/fc0011.ko \
    $(KERNEL_MODULES_OUT)/fc0012.ko \
    $(KERNEL_MODULES_OUT)/fc0013.ko \
    $(KERNEL_MODULES_OUT)/fc2580.ko \
    $(KERNEL_MODULES_OUT)/fts_touch_spi.ko \
    $(KERNEL_MODULES_OUT)/goodix_fod.ko \
    $(KERNEL_MODULES_OUT)/hdmi_dlkm.ko \
    $(KERNEL_MODULES_OUT)/hid-aksys.ko \
    $(KERNEL_MODULES_OUT)/hwid.ko \
    $(KERNEL_MODULES_OUT)/icnss2.ko \
    $(KERNEL_MODULES_OUT)/ir-spi.ko \
    $(KERNEL_MODULES_OUT)/it913x.ko \
    $(KERNEL_MODULES_OUT)/leds-qti-flash.ko \
    $(KERNEL_MODULES_OUT)/llcc_perfmon.ko \
    $(KERNEL_MODULES_OUT)/m88rs6000t.ko \
    $(KERNEL_MODULES_OUT)/machine_dlkm.ko \
    $(KERNEL_MODULES_OUT)/max2165.ko \
    $(KERNEL_MODULES_OUT)/mbhc_dlkm.ko \
    $(KERNEL_MODULES_OUT)/mc44s803.ko \
    $(KERNEL_MODULES_OUT)/mi_thermal_interface.ko \
    $(KERNEL_MODULES_OUT)/msi001.ko \
    $(KERNEL_MODULES_OUT)/mt2060.ko \
    $(KERNEL_MODULES_OUT)/mt2063.ko \
    $(KERNEL_MODULES_OUT)/mt20xx.ko \
    $(KERNEL_MODULES_OUT)/mt2131.ko \
    $(KERNEL_MODULES_OUT)/mt2266.ko \
    $(KERNEL_MODULES_OUT)/mxl301rf.ko \
    $(KERNEL_MODULES_OUT)/mxl5005s.ko \
    $(KERNEL_MODULES_OUT)/mxl5007t.ko \
    $(KERNEL_MODULES_OUT)/native_dlkm.ko \
    $(KERNEL_MODULES_OUT)/pinctrl_lpi_dlkm.ko \
    $(KERNEL_MODULES_OUT)/pinctrl_wcd_dlkm.ko \
    $(KERNEL_MODULES_OUT)/platform_dlkm.ko \
    $(KERNEL_MODULES_OUT)/q6_dlkm.ko \
    $(KERNEL_MODULES_OUT)/q6_notifier_dlkm.ko \
    $(KERNEL_MODULES_OUT)/q6_pdr_dlkm.ko \
    $(KERNEL_MODULES_OUT)/qm1d1b0004.ko \
    $(KERNEL_MODULES_OUT)/qm1d1c0042.ko \
    $(KERNEL_MODULES_OUT)/qt1010.ko \
    $(KERNEL_MODULES_OUT)/qti_battery_charger_main_odin.ko \
    $(KERNEL_MODULES_OUT)/r820t.ko \
    $(KERNEL_MODULES_OUT)/rmnet_core.ko \
    $(KERNEL_MODULES_OUT)/rmnet_ctl.ko \
    $(KERNEL_MODULES_OUT)/rmnet_offload.ko \
    $(KERNEL_MODULES_OUT)/rmnet_shs.ko \
    $(KERNEL_MODULES_OUT)/rx_macro_dlkm.ko \
    $(KERNEL_MODULES_OUT)/si2157.ko \
    $(KERNEL_MODULES_OUT)/slimbus-ngd.ko \
    $(KERNEL_MODULES_OUT)/slimbus.ko \
    $(KERNEL_MODULES_OUT)/snd_event_dlkm.ko \
    $(KERNEL_MODULES_OUT)/sr100.ko \
    $(KERNEL_MODULES_OUT)/stmvl53l5.ko \
    $(KERNEL_MODULES_OUT)/stub_dlkm.ko \
    $(KERNEL_MODULES_OUT)/swr_ctrl_dlkm.ko \
    $(KERNEL_MODULES_OUT)/swr_dlkm.ko \
    $(KERNEL_MODULES_OUT)/swr_dmic_dlkm.ko \
    $(KERNEL_MODULES_OUT)/tda18212.ko \
    $(KERNEL_MODULES_OUT)/tda18218.ko \
    $(KERNEL_MODULES_OUT)/tda18250.ko \
    $(KERNEL_MODULES_OUT)/tda9887.ko \
    $(KERNEL_MODULES_OUT)/tea5761.ko \
    $(KERNEL_MODULES_OUT)/tea5767.ko \
    $(KERNEL_MODULES_OUT)/tua9001.ko \
    $(KERNEL_MODULES_OUT)/tuner-simple.ko \
    $(KERNEL_MODULES_OUT)/tuner-types.ko \
    $(KERNEL_MODULES_OUT)/tuner-xc2028.ko \
    $(KERNEL_MODULES_OUT)/tx_macro_dlkm.ko \
    $(KERNEL_MODULES_OUT)/us_prox_iio.ko \
    $(KERNEL_MODULES_OUT)/va_macro_dlkm.ko \
    $(KERNEL_MODULES_OUT)/wcd937x_dlkm.ko \
    $(KERNEL_MODULES_OUT)/wcd937x_slave_dlkm.ko \
    $(KERNEL_MODULES_OUT)/wcd938x_dlkm.ko \
    $(KERNEL_MODULES_OUT)/wcd938x_slave_dlkm.ko \
    $(KERNEL_MODULES_OUT)/wcd9xxx_dlkm.ko \
    $(KERNEL_MODULES_OUT)/wcd_core_dlkm.ko \
    $(KERNEL_MODULES_OUT)/wlan.ko \
    $(KERNEL_MODULES_OUT)/wlan_firmware_service_v01.ko \
    $(KERNEL_MODULES_OUT)/wsa883x_dlkm.ko \
    $(KERNEL_MODULES_OUT)/wsa_macro_dlkm.ko \
    $(KERNEL_MODULES_OUT)/xc4000.ko \
    $(KERNEL_MODULES_OUT)/xc5000.ko \
    $(KERNEL_MODULES_OUT)/xiaomi_touch.ko

# NFC
TARGET_USES_NQ_NFC := true

# OTA assert
TARGET_OTA_ASSERT_DEVICE := odin

# Partitions
BOARD_FLASH_BLOCK_SIZE := 262144 # (BOARD_KERNEL_PAGESIZE * 64)
BOARD_BOOTIMAGE_PARTITION_SIZE := 0xC000000
BOARD_VENDOR_BOOTIMAGE_PARTITION_SIZE := 100663296
BOARD_DTBOIMG_PARTITION_SIZE := 0x1800000
BOARD_USES_METADATA_PARTITION := true

BOARD_SUPER_PARTITION_SIZE := 9126805504
BOARD_SUPER_PARTITION_GROUPS := qti_dynamic_partitions
BOARD_QTI_DYNAMIC_PARTITIONS_PARTITION_LIST := odm product system system_ext vendor vendor_dlkm
BOARD_QTI_DYNAMIC_PARTITIONS_SIZE := 9122611200 # (BOARD_SUPER_PARTITION_SIZE - 4MB overhead)

BOARD_PRODUCTIMAGE_PARTITION_RESERVED_SIZE := 104857600
BOARD_SYSTEMIMAGE_PARTITION_RESERVED_SIZE := 104857600
BOARD_SYSTEM_EXTIMAGE_PARTITION_RESERVED_SIZE := 104857600
BOARD_VENDORIMAGE_PARTITION_RESERVED_SIZE := 104857600
BOARD_ODMIMAGE_PARTITION_RESERVED_SIZE := 104857600

BOARD_PRODUCTIMAGE_FILE_SYSTEM_TYPE := erofs
BOARD_SYSTEMIMAGE_FILE_SYSTEM_TYPE := erofs
BOARD_SYSTEM_EXTIMAGE_FILE_SYSTEM_TYPE := erofs
BOARD_VENDORIMAGE_FILE_SYSTEM_TYPE := erofs
BOARD_VENDOR_DLKMIMAGE_FILE_SYSTEM_TYPE := erofs
BOARD_ODMIMAGE_FILE_SYSTEM_TYPE := erofs

TARGET_COPY_OUT_ODM := odm
TARGET_COPY_OUT_PRODUCT := product
TARGET_COPY_OUT_SYSTEM_EXT := system_ext
TARGET_COPY_OUT_VENDOR := vendor
TARGET_COPY_OUT_VENDOR_DLKM := vendor_dlkm

BOARD_EROFS_COMPRESSOR := lz4
BOARD_EROFS_PCLUSTER_SIZE := 262144
PRODUCT_VIRTUAL_AB_COMPRESSION_METHOD := lz4

# Power
TARGET_TAP_TO_WAKE_NODE := "/sys/devices/virtual/touch/tp_dev/double_tap"

# PowerShare
TARGET_POWERSHARE_NODE := /sys/class/qcom-battery/reverse_chg_mode

# Properties
TARGET_ODM_PROP += $(DEVICE_PATH)/configs/props/odm.prop
TARGET_SYSTEM_PROP += $(DEVICE_PATH)/configs/props/system.prop
TARGET_SYSTEM_EXT_PROP += $(DEVICE_PATH)/configs/props/system_ext.prop
TARGET_VENDOR_PROP += $(DEVICE_PATH)/configs/props/vendor.prop

# Recovery
BOARD_INCLUDE_DTB_IN_BOOTIMG := true
BOARD_MOVE_RECOVERY_RESOURCES_TO_VENDOR_BOOT := true
BOARD_INCLUDE_RECOVERY_RAMDISK_IN_VENDOR_BOOT := true
TARGET_RECOVERY_FSTAB := $(DEVICE_PATH)/rootdir/etc/fstab.qcom
TARGET_RECOVERY_PIXEL_FORMAT := "RGBX_8888"
TARGET_USERIMAGES_USE_F2FS := true

SOONG_CONFIG_NAMESPACES += ufsbsg
SOONG_CONFIG_ufsbsg += ufsframework
SOONG_CONFIG_ufsbsg_ufsframework := bsg

# Sensors
SOONG_CONFIG_NAMESPACES += SENSORS_XIAOMI
SOONG_CONFIG_SENSORS_XIAOMI += USES_UDFPS_SENSOR
SOONG_CONFIG_SENSORS_XIAOMI_USES_UDFPS_SENSOR := true

# Sepolicy
SYSTEM_EXT_PRIVATE_SEPOLICY_DIRS += $(DEVICE_PATH)/sepolicy/private
SYSTEM_EXT_PUBLIC_SEPOLICY_DIRS += $(DEVICE_PATH)/sepolicy/public
BOARD_VENDOR_SEPOLICY_DIRS += $(DEVICE_PATH)/sepolicy/vendor

# Verified Boot
BOARD_AVB_ENABLE := true
BOARD_AVB_MAKE_VBMETA_IMAGE_ARGS += --flags 3

BOARD_AVB_RECOVERY_ALGORITHM := SHA256_RSA4096
BOARD_AVB_RECOVERY_KEY_PATH := external/avb/test/data/testkey_rsa4096.pem
BOARD_AVB_RECOVERY_ROLLBACK_INDEX := $(PLATFORM_SECURITY_PATCH_TIMESTAMP)
BOARD_AVB_RECOVERY_ROLLBACK_INDEX_LOCATION := 1

BOARD_AVB_VBMETA_SYSTEM := product system system_ext
BOARD_AVB_VBMETA_SYSTEM_ALGORITHM := SHA256_RSA4096
BOARD_AVB_VBMETA_SYSTEM_KEY_PATH := external/avb/test/data/testkey_rsa4096.pem
BOARD_AVB_VBMETA_SYSTEM_ROLLBACK_INDEX := $(PLATFORM_SECURITY_PATCH_TIMESTAMP)
BOARD_AVB_VBMETA_SYSTEM_ROLLBACK_INDEX_LOCATION := 2

BOARD_MOVE_GSI_AVB_KEYS_TO_VENDOR_BOOT := true
BOARD_AVB_VENDOR_ADD_HASHTREE_FOOTER_ARGS += --hash_algorithm sha256
BOARD_AVB_ODM_ADD_HASHTREE_FOOTER_ARGS += --hash_algorithm sha256

# WiFi
BOARD_WLAN_DEVICE := qcwcn
BOARD_HOSTAPD_DRIVER := NL80211
BOARD_HOSTAPD_PRIVATE_LIB := lib_driver_cmd_$(BOARD_WLAN_DEVICE)
BOARD_WPA_SUPPLICANT_DRIVER := NL80211
BOARD_WPA_SUPPLICANT_PRIVATE_LIB := lib_driver_cmd_$(BOARD_WLAN_DEVICE)
QC_WIFI_HIDL_FEATURE_DUAL_AP := true
WIFI_DRIVER_DEFAULT := wlan
WIFI_DRIVER_STATE_CTRL_PARAM := "/dev/wlan"
WIFI_DRIVER_STATE_OFF := "OFF"
WIFI_DRIVER_STATE_ON := "ON"
WIFI_HIDL_FEATURE_AWARE := true
WIFI_HIDL_FEATURE_DUAL_INTERFACE := true
WIFI_HIDL_UNIFIED_SUPPLICANT_SERVICE_RC_ENTRY := true
WPA_SUPPLICANT_VERSION := VER_0_8_X
CONFIG_ACS := true
CONFIG_IEEE80211AX := true
CONFIG_IEEE80211AC := true

# Inherit proprietary blobs
include vendor/xiaomi/odin/BoardConfigVendor.mk

# Inherit from proprietary files for miuicamera
-include vendor/xiaomi/odin-miuicamera/products/board.mk
