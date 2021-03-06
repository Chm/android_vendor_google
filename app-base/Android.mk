LOCAL_PATH := $(call my-dir)

#----------------------------------------------------------------
#		Google apps
#----------------------------------------------------------------
all-google-apks := $(patsubst $(LOCAL_PATH)/%,%,$(wildcard $(LOCAL_PATH)/*.apk))
$(info All Google APK Files: $(all-google-apks))

$(foreach m, $(all-google-apks), \
	$(eval include $(CLEAR_VARS)) \
	$(eval m := $(strip $(notdir $(m)))) \
	$(eval LOCAL_MODULE := $(patsubst %.apk,%,$(m))) \
	$(eval LOCAL_MODULE_TAGS := optional) \
	$(eval LOCAL_MODULE_CLASS := APPS) \
	$(eval LOCAL_MODULE_SUFFIX := $(COMMON_ANDROID_PACKAGE_SUFFIX)) \
	$(eval LOCAL_CERTIFICATE := PRESIGNED) \
	$(eval LOCAL_SRC_FILES := $(m)) \
	$(eval gms_base:$(LOCAL_MODULE)) \
	$(eval include $(BUILD_PREBUILT)) \
	$(eval m := ) \
)
all-google-apks :=
