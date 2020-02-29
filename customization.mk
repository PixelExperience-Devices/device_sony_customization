# Copyright (C) 2019 AngeloGioacchino Del Regno <kholk11@gmail.com>
#
# ROM specific customization for Sony Open Devices
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

TARGET_GAPPS_ARCH := arm64

TARGET_KERNEL_HEADERS := kernel/sony/msm-4.14/kernel

CUST_PATH := device/sony/customization

ifneq ($(filter aosp_f53% aosp_g1109, $(TARGET_PRODUCT)),)
TARGET_SCREEN_HEIGHT := 1280
TARGET_SCREEN_WIDTH := 720
endif

ifneq ($(filter aosp_f51% aosp_f8% aosp_g82% aosp_g83% aosp_h%13 aosp_i%13, $(TARGET_PRODUCT)),)
TARGET_SCREEN_HEIGHT := 1920
TARGET_SCREEN_WIDTH := 1080
endif

ifneq ($(filter aosp_h82%6 aosp_h83%4, $(TARGET_PRODUCT)),)
TARGET_SCREEN_HEIGHT := 2160
TARGET_SCREEN_WIDTH := 1080
endif

ifneq ($(filter aosp_h84%6 aosp_h94%6, $(TARGET_PRODUCT)),)
TARGET_SCREEN_HEIGHT := 2880
TARGET_SCREEN_WIDTH := 1440
endif

ifneq ($(filter aosp_j%210, $(TARGET_PRODUCT)),)
TARGET_SCREEN_HEIGHT := 2520
TARGET_SCREEN_WIDTH := 1080
endif

ifneq ($(filter aosp_g814%, $(TARGET_PRODUCT)),)
TARGET_SCREEN_HEIGHT := 3840
TARGET_SCREEN_WIDTH := 2160
endif

ifneq ($(filter aosp_j%110, $(TARGET_PRODUCT)),)
TARGET_SCREEN_HEIGHT := 3240
TARGET_SCREEN_WIDTH := 3288
endif

ifneq ($(filter aosp_j%110 aosp_g814%, $(TARGET_PRODUCT)),)
# Faking to 1080 to get the right bootanimation res on:
# Griffin (3240x3288), Maple(3840x2160)
TARGET_BOOT_ANIMATION_RES := 1080
else
TARGET_BOOT_ANIMATION_RES := $(TARGET_SCREEN_WIDTH)
endif

# Product for OTA
CUSTOM_TARGET_DEVICE := $(CUSTOM_BUILD)

PRODUCT_PACKAGES += \
    e2fsprogs \
    strace

TARGET_RECOVERY_DEVICE_MODULES := tune2fs strace

# Google Wifi Hal
TARGET_INCLUDE_WIFI_EXT := false

# cust packages
PRODUCT_PACKAGES += \
    ims \
    ims_symlinks \
    QtiTelephonyService \
    QtiSystemService \
    libdiagsystem \
    bindmountims.rc \
    qti-telephony-hidl-wrapper \
    qti_telephony_hidl_wrapper.xml \
    qti-telephony-utils \
    qti_telephony_utils.xml \
    ims-ext-common \
    ims_ext_common.xml \
    telephony-ext \
    libimscamera_jni \
    libimsmedia_jni \
    embms \
    qcrilmsgtunnel \
    uceShimService \
    uimgbaservice \
    uimlpaservice \
    HotwordEnrollmentOKGoogleHEXAGON \
    HotwordEnrollmentXGoogleHEXAGON

PRODUCT_BOOT_JARS += \
    telephony-ext

# Permissions for Hotword
PRODUCT_COPY_FILES += \
    $(CUST_PATH)/HotwordEnrollmentXGoogleHEXAGON/privapp-permissions-xGoogleHEXAGON.xml:$(TARGET_COPY_OUT_PRODUCT)/etc/permissions/privapp-permissions-xGoogleHEXAGON.xml \
    $(CUST_PATH)/HotwordEnrollmentOKGoogleHEXAGON/privapp-permissions-OkGoogleHEXAGON.xml:$(TARGET_COPY_OUT_PRODUCT)/etc/permissions/privapp-permissions-OkGoogleHEXAGON.xml

# IMS
PRODUCT_COPY_FILES += \
    $(COMMON_PATH)/rootdir/vendor/etc/permissions/privapp-permissions-ims.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/permissions/privapp-permissions-ims.xml \
    $(CUST_PATH)/ims/com.qualcomm.qti.imscmservice-V2.0-java.xml:$(TARGET_COPY_OUT_PRODUCT)/etc/permissions/com.qualcomm.qti.imscmservice-V2.0-java.xml \
    $(CUST_PATH)/ims/embms.xml:$(TARGET_COPY_OUT_PRODUCT)/etc/permissions/embms.xml \
    $(CUST_PATH)/ims/lpa.xml:$(TARGET_COPY_OUT_PRODUCT)/etc/permissions/lpa.xml \
    $(CUST_PATH)/ims/qcrilhook.xml:$(TARGET_COPY_OUT_PRODUCT)/etc/permissions/qcrilhook.xml \
    frameworks/native/data/etc/android.hardware.telephony.ims.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.telephony.ims.xml \
    $(CUST_PATH)/ims/qcrilmsgtunnel.xml:$(TARGET_COPY_OUT_PRODUCT)/etc/permissions/privapp-permissions-qcrilmsgtunnel.xml \
    $(CUST_PATH)/ims/telephonyservice.xml:$(TARGET_COPY_OUT_PRODUCT)/etc/permissions/telephonyservice.xml \
    $(CUST_PATH)/ims/UimGba.xml:$(TARGET_COPY_OUT_PRODUCT)/etc/permissions/UimGba.xml \
    $(CUST_PATH)/ims/UimGbaManager.xml:$(TARGET_COPY_OUT_PRODUCT)/etc/permissions/UimGbaManager.xml \
    $(CUST_PATH)/ims/uimremoteclient.xml:$(TARGET_COPY_OUT_PRODUCT)/etc/permissions/uimremoteclient.xml \
    $(CUST_PATH)/ims/uimremoteserver.xml:$(TARGET_COPY_OUT_PRODUCT)/etc/permissions/uimremoteserver.xml \
    $(CUST_PATH)/ims/UimService.xml:$(TARGET_COPY_OUT_PRODUCT)/etc/permissions/UimService.xml \
    $(CUST_PATH)/ims/com.qualcomm.qti.imscmservice-V2.0-java.jar:$(TARGET_COPY_OUT_PRODUCT)/framework/com.qualcomm.qti.imscmservice-V2.0-java.jar \
    $(CUST_PATH)/ims/qcrilhook.jar:$(TARGET_COPY_OUT_PRODUCT)/framework/qcrilhook.jar \
    $(CUST_PATH)/ims/QtiTelephonyServicelibrary.jar:$(TARGET_COPY_OUT_PRODUCT)/framework/QtiTelephonyServicelibrary.jar \
    $(CUST_PATH)/ims/uimgbalibrary.jar:$(TARGET_COPY_OUT_PRODUCT)/framework/uimgbalibrary.jar \
    $(CUST_PATH)/ims/uimgbamanagerlibrary.jar:$(TARGET_COPY_OUT_PRODUCT)/framework/uimgbamanagerlibrary.jar \
    $(CUST_PATH)/ims/uimlpalibrary.jar:$(TARGET_COPY_OUT_PRODUCT)/framework/uimlpalibrary.jar

PRODUCT_PROPERTY_OVERRIDES += \
    persist.dbg.volte_avail_ovr=1 \
    persist.dbg.vt_avail_ovr=1  \
    persist.dbg.wfc_avail_ovr=1

# USB debugging at boot
PRODUCT_PROPERTY_OVERRIDES += \
    persist.sys.usb.config=mtp,adb \
    ro.adb.secure=0 \
    ro.secure=0 \
    ro.debuggable=1

# Update recovery with the ota for legacy
ifneq ($(filter loire tone yoshino, $(SOMC_PLATFORM)),)
PRODUCT_PROPERTY_OVERRIDES += \
    persist.sys.recovery_update=true
else
PRODUCT_PROPERTY_OVERRIDES += \
    persist.sys.recovery_update=false
endif

# VoLTE
PRODUCT_PROPERTY_OVERRIDES += \
    persist.vendor.radio.is_voip_enabled=1 \
    persist.vendor.radio.rat_on=combine \
    persist.vendor.radio.voice_on_lte=1

TARGET_USES_AOSP_APNS_CONF := true

# Wallpapers
PRODUCT_PACKAGES += \
    PixelLiveWallpaperPrebuilt

# Widevine
$(call inherit-product-if-exists, vendor/widevine/widevine.mk)

# Updatable Apex
DEXPREOPT_GENERATE_APEX_IMAGE := true

# Temporary: Enable QCRILD for all platforms
TARGET_USE_QCRILD := true

-include vendor/aosp/config/common_full_phone.mk
