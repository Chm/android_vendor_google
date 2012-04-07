LOCAL_PATH := $(call my-dir)

#----------------------------------------------------------------
#		add .so prebuilt files
#----------------------------------------------------------------
google-shared-libs := $(patsubst $(LOCAL_PATH)/%,%,$(wildcard $(LOCAL_PATH)/*.so))
$(foreach m,$(google-shared-libs),\
	$(eval include $(CLEAR_VARS)) \
	$(eval LOCAL_MODULE := $(strip $(notdir $(m)))) \
	$(eval LOCAL_MODULE_TAGS := optional) \
	$(eval LOCAL_MODULE_CLASS := SHARED_LIBRARIES) \
	$(eval LOCAL_SRC_FILES := $(m)) \
	$(eval GMS_BASE:$(LOCAL_MODULE)) \
	$(eval include $(BUILD_PREBUILT)) \
	$(eval m := ) \
)
google-shared-libs :=
