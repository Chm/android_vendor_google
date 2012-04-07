LOCAL_PATH := $(call my-dir)

#----------------------------------------------------------------
#		Google platform apps
#----------------------------------------------------------------
all-platform-google-apks := $(patsubst $(LOCAL_PATH)/%,%,$(wildcard $(LOCAL_PATH)/*.apk))
$(info All Platform Google APK Files: $(all-platform-google-apks))

$(foreach m, $(all-platform-google-apks), \
	$(eval include $(CLEAR_VARS)) \
	$(eval m := $(strip $(notdir $(m)))) \
	$(eval LOCAL_MODULE := $(patsubst %.apk,%,$(m))) \
	$(eval LOCAL_MODULE_TAGS := optional) \
	$(eval LOCAL_MODULE_CLASS := APPS) \
	$(eval LOCAL_MODULE_SUFFIX := $(COMMON_ANDROID_PACKAGE_SUFFIX)) \
	$(eval LOCAL_CERTIFICATE := platform) \
	$(eval LOCAL_SRC_FILES := $(m)) \
	$(eval GMS_BASE:$(LOCAL_MODULE)) \
	$(eval include $(BUILD_PREBUILT)) \
	$(eval m := ) \
)
all-platform-google-apks :=
