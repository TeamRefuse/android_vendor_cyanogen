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
PRODUCT_BUILD_PROP_OVERRIDES += PRODUCT_NAME=SGH-I997 BUILD_ID=GINGERBREAD BUILD_FINGERPRINT=samsung/SGH-I997/SGH-I997:2.3.5/GINGERBREAD/UCKJ1:user/release-keys PRIVATE_BUILD_DESC="SGH-I997-user 2.3.5 GINGERBREAD UCKJ1 release-keys"

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

# Release name and versioning
PRODUCT_RELEASE_NAME := Infuse4G
PRODUCT_VERSION_DEVICE_SPECIFIC :=
-include vendor/cyanogen/products/common_versions.mk

#
# Copy infuse4g specific prebuilt files
#
PRODUCT_COPY_FILES +=  \
    vendor/cyanogen/prebuilt/hdpi/media/bootanimation.zip:system/media/bootanimation.zip
