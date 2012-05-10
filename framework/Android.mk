LOCAL_PATH := $(call my-dir)

#----------------------------------------------------------------
#		Google framework jars
#----------------------------------------------------------------
google-jar-files := $(patsubst $(LOCAL_PATH)/%,%,$(wildcard $(LOCAL_PATH)/*.jar))
$(foreach m, $(google-jar-files), \
	$(eval include $(CLEAR_VARS)) \
	$(eval LOCAL_MODULE := $(strip $(notdir $(m)))) \
	$(eval LOCAL_MODULE_TAGS := optional) \
	$(eval LOCAL_MODULE_CLASS := JAVA_LIBRARIES) \
	$(eval LOCAL_SRC_FILES := $(m)) \
	$(eval gms_base:$(LOCAL_MODULE)) \
	$(eval include $(BUILD_PREBUILT)) \
	$(eval m := ) \
)
google-jar-files :=
