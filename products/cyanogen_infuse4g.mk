# Inherit AOSP device configuration for infuse4g.
$(call inherit-product, device/samsung/infuse4g/full_infuse4g.mk)

# Inherit some common cyanogenmod stuff.
$(call inherit-product, vendor/cyanogen/products/common_full.mk)

# Include GSM stuff
$(call inherit-product, vendor/cyanogen/products/gsm.mk)

#
# Setup device specific product configuration.
#
PRODUCT_NAME := cyanogen_infuse4g
PRODUCT_BRAND := samsung
PRODUCT_DEVICE := infuse4g
PRODUCT_MODEL := SGH-I997
PRODUCT_MANUFACTURER := samsung
PRODUCT_BUILD_PROP_OVERRIDES += PRODUCT_NAME=soju BUILD_ID=GRJ22 BUILD_DISPLAY_ID=GRJ90 BUILD_FINGERPRINT=google/soju/crespo:2.3.4/GRJ22/121341:user/release-keys PRIVATE_BUILD_DESC="soju-user 2.3.4 GRJ22 121341 release-keys"

# Extra infuse4g overlay
PRODUCT_PACKAGE_OVERLAYS += vendor/cyanogen/overlay/infuse4g

# Extra RIL settings
PRODUCT_PROPERTY_OVERRIDES += \
    ro.ril.enable.managed.roaming=1 \
    ro.ril.oem.nosim.ecclist=911,112,999,000,08,118,120,122,110,119,995 \
    ro.ril.emc.mode=2 \
	ro.ril.hsxpa=2 \
	ro.ril.gprsclass=12 \
	ro.ril.hsdpa.category=14 \
	ro.ril.hsupa.category=6

# Add additional mounts
PRODUCT_PROPERTY_OVERRIDES += \
    ro.additionalmounts=/mnt/emmc \
	ro.vold.switchablepair=/mnt/sdcard,/mnt/emmc

#
# Set ro.modversion
#
ifdef CYANOGEN_NIGHTLY
    PRODUCT_PROPERTY_OVERRIDES += \
        ro.modversion=CyanogenMod-7-$(shell date +%m%d%Y)-NIGHTLY-Infuse4G
else
    ifdef CYANOGEN_RELEASE
        PRODUCT_PROPERTY_OVERRIDES += \
            ro.modversion=CyanogenMod-7.1.0-Infuse4G
    else
        PRODUCT_PROPERTY_OVERRIDES += \
            ro.modversion=CyanogenMod-7.1.0-Infuse4G-KANG
    endif
endif

#
# Copy infuse4g specific prebuilt files
#
PRODUCT_COPY_FILES +=  \
    vendor/cyanogen/prebuilt/hdpi/media/bootanimation.zip:system/media/bootanimation.zip
