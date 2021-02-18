#
# Copyright (C) 2019 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

# Inherit from msm8937-common
$(call inherit-product, device/motorola/msm8937-common/msm8937.mk)

# Get non-open-source specific aspects
$(call inherit-product-if-exists, vendor/motorola/hannah/hannah-vendor.mk)

# Boot animation
TARGET_SCREEN_HEIGHT := 1440
TARGET_SCREEN_WIDTH := 720

# Exclude Snap overlays from RRO
PRODUCT_ENFORCE_RRO_EXCLUDED_OVERLAYS += \
    $(LOCAL_PATH)/overlay-lineage/packages/apps/Snap

# Overlays
DEVICE_PACKAGE_OVERLAYS += \
    $(LOCAL_PATH)/overlay \
    $(LOCAL_PATH)/overlay-lineage

# Properties
-include $(LOCAL_PATH)/vendor_prop.mk

# Audio
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/audio/audio_platform_info.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_platform_info.xml \
    $(LOCAL_PATH)/audio/audio_platform_info_ahannah.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_platform_info_ahannah.xml \
    $(LOCAL_PATH)/audio/mixer_paths.xml:$(TARGET_COPY_OUT_VENDOR)/etc/mixer_paths.xml \
    $(LOCAL_PATH)/audio/mixer_paths_ahannah.xml:$(TARGET_COPY_OUT_VENDOR)/etc/mixer_paths_ahannah.xml

# Camera
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/camera/mot_s5k4h7_hannah_chromatix.xml:$(TARGET_COPY_OUT_VENDOR)/etc/camera/mot_s5k4h7_hannah_chromatix.xml \
    $(LOCAL_PATH)/configs/camera/msm8937_mot_hannah_camera.xml:$(TARGET_COPY_OUT_VENDOR)/etc/camera/msm8937_mot_hannah_camera.xml \
    $(LOCAL_PATH)/configs/camera/ov12a10_hannah_chromatix.xml:$(TARGET_COPY_OUT_VENDOR)/etc/camera/ov12a10_hannah_chromatix.xml \
    $(LOCAL_PATH)/configs/camera/ov5675_jeterht_chromatix.xml:$(TARGET_COPY_OUT_VENDOR)/etc/camera/ov5675_jeterht_chromatix.xml \
    $(LOCAL_PATH)/configs/camera/ov5675_jeterkc_chromatix.xml:$(TARGET_COPY_OUT_VENDOR)/etc/camera/ov5675_jeterkc_chromatix.xml

# Keylayout
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/keylayout/uinput-egis.kl:$(TARGET_COPY_OUT_VENDOR)/usr/keylayout/uinput-egis.kl

# IDC
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/idc/uinput-egis.idc:$(TARGET_COPY_OUT_VENDOR)/usr/idc/uinput-egis.idc

# Ramdisk
PRODUCT_PACKAGES += \
    init.device.rc

PRODUCT_PACKAGES += \
    init.mmi.laser.sh \
    init.qcom.sensors.sh

# Releasetools script
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/check_device.sh:install/bin/check_device.sh

# Sensors
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/sensors/hals.conf:$(TARGET_COPY_OUT_VENDOR)/etc/sensors/hals.conf \
    $(LOCAL_PATH)/configs/sensors/sensor_def_qcomdev.conf:$(TARGET_COPY_OUT_VENDOR)/etc/sensors/sensor_def_qcomdev.conf \
    $(LOCAL_PATH)/configs/sensors/sensor_def_qcomdev_ahannah.conf:$(TARGET_COPY_OUT_VENDOR)/etc/sensors/sensor_def_qcomdev_ahannah.conf

# Soong namespaces
PRODUCT_SOONG_NAMESPACES += \
    $(LOCAL_PATH)
