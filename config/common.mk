PRODUCT_BRAND ?= liquid

# superuser
SUPERUSER_EMBEDDED := true
SUPERUSER_PACKAGE_PREFIX := com.android.settings.liquid.superuser

# overrides
PRODUCT_PROPERTY_OVERRIDES += \
    keyguard.no_require_sim=true \
    ro.url.legal=http://www.google.com/intl/%s/mobile/android/basic/phone-legal.html \
    ro.url.legal.android_privacy=http://www.google.com/intl/%s/mobile/android/basic/privacy.html \
    ro.com.google.clientidbase=android-google \
    ro.com.android.wifi-watchlist=GoogleGuest \
    ro.com.android.dateformat=MM-dd-yyyy \
    ro.setupwizard.enterprise_mode=1 \
    ro.com.android.dataroaming=false

# packages
PRODUCT_PACKAGES += \
    Camera \
    Galaxy4 \
    HALO \
    HoloSpiralWallpaper \
    LiveWallpapers \
    LiveWallpapersPicker \
    NoiseField \
    PhaseBeam \
    Torch

# others
PRODUCT_PACKAGES += \
    Apollo \
    DashClock \
    DSPManager \
    libcyanogen-dsp \
    audio_effects.conf \
    PerformanceControl \
    SoundRecorder \
    Superuser \
    Widgets \
    su

# prebuilts
PRODUCT_PACKAGES += \
    LatinIME \
    LiquidPapers \
    LockClock \
    XposedDPI \
    XposedInstaller

# telephony
PRODUCT_PACKAGES += \
    CellBroadcastReceiver \
    Provision
    
# theme chooser
PRODUCT_PACKAGES += \
    ThemeManager \
    ThemeChooser \
    com.tmobile.themes

# system tools
PRODUCT_PACKAGES += \
    e2fsck \
    mke2fs \
    tune2fs

# overlay
PRODUCT_PACKAGE_OVERLAYS += vendor/liquid/overlay/common

# dictionaries
PRODUCT_PACKAGE_OVERLAYS += vendor/liquid/overlay/dictionaries

# bin
PRODUCT_COPY_FILES += \
    vendor/liquid/prebuilt/common/bin/sysinit:system/bin/sysinit

# etc
PRODUCT_COPY_FILES += \
    vendor/liquid/prebuilt/common/etc/init.liquid.rc:root/init.liquid.rc

# prebuilt
PRODUCT_COPY_FILES += \
    vendor/liquid/prebuilt/common/xbin/sysro:system/xbin/sysro \
    vendor/liquid/prebuilt/common/xbin/sysrw:system/xbin/sysrw \
    vendor/liquid/prebuilt/common/media/LMprec_508.emd:system/media/LMprec_508.emd \
    vendor/liquid/prebuilt/common/media/PFFprec_600.emd:system/media/PFFprec_600.emd

# keyboard
ifdef BUILD_WITH_SOURCE_JNI
PRODUCT_PACKAGES += \
    libjni_latinime
else
PRODUCT_COPY_FILES += \
    vendor/liquid/prebuilt/common/lib/libjni_latinime.so:system/lib/libjni_latinime.so
endif

# launcher
PRODUCT_COPY_FILES += \
    vendor/liquid/proprietary/NovaLauncher/NovaLauncher.apk:system/app/NovaLauncher.apk

# media
ifneq ($(TARGET_SCREEN_WIDTH) $(TARGET_SCREEN_HEIGHT),$(space))
PRODUCT_COPY_FILES += \
    vendor/liquid/prebuilt/common/bootanimation/$(TARGET_SCREEN_WIDTH).zip:system/media/bootanimation.zip
endif

# sip/voip
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml

# theme chooser
PRODUCT_COPY_FILES += \
    vendor/liquid/config/permissions/com.tmobile.software.themes.xml:system/etc/permissions/com.tmobile.software.themes.xml

# nfc
PRODUCT_COPY_FILES += \
    vendor/liquid/config/permissions/com.liquidsmooth.android.xml:system/etc/permissions/com.liquidsmooth.android.xml \
    vendor/liquid/config/permissions/com.liquidsmooth.nfc.enhanced.xml:system/etc/permissions/com.liquidsmooth.nfc.enhanced.xml

# version
RELEASE = false
LIQUID_VERSION_MAJOR = 2
LIQUID_VERSION_MINOR = 9

ifeq ($(RELEASE),true)
    LIQUID_VERSION_STATE := OFFICIAL
    LIQUID_VERSION := Liquid-JB-v$(LIQUID_VERSION_MAJOR).$(LIQUID_VERSION_MINOR)-$(LIQUID_VERSION_STATE)
else
    LIQUID_VERSION_STATE := NIGHTLY
    LIQUID_VERSION := Liquid-JB-v$(LIQUID_VERSION_MAJOR).$(LIQUID_VERSION_MINOR)-$(LIQUID_VERSION_STATE)
endif

# goo.im
ifeq ($(RELEASE),true)
    PRODUCT_PROPERTY_OVERRIDES += \
        ro.goo.rom=liquidsmoothJB2 \
        ro.goo.developerid=liquidsmooth \
        ro.goo.version=$(shell date +%Y%m%d)
else
    PRODUCT_PROPERTY_OVERRIDES += \
        ro.goo.rom=liquidsmoothJB2nightly \
        ro.goo.developerid=liquidsmooth \
        ro.goo.version=$(shell date +%Y%m%d)
endif

PRODUCT_PROPERTY_OVERRIDES += \
    ro.liquid.version=$(LIQUID_VERSION)
