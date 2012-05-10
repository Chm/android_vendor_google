LOCAL_PATH := $(call my-dir)

#----------------------------------------------------------------
#		Google etc permission files.
#----------------------------------------------------------------
permisson-files := $(patsubst $(LOCAL_PATH)/%,%,$(wildcard $(LOCAL_PATH)/permissions/*.xml))
$(foreach m,$(permisson-files),\
	$(eval include $(CLEAR_VARS)) \
	$(eval LOCAL_MODULE := $(strip $(notdir $(m)))) \
	$(eval LOCAL_MODULE_TAGS := optional) \
	$(eval LOCAL_MODULE_CLASS := ETC) \
	$(eval LOCAL_MODULE_PATH := $(TARGET_OUT_ETC)/permissions/) \
	$(eval LOCAL_SRC_FILES := $(m)) \
	$(eval gms_base:$(LOCAL_MODULE)) \
	$(eval include $(BUILD_PREBUILT)) \
	$(eval m := ) \
)
permisson-files :=
