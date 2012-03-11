LOCAL_PATH := $(call my-dir)

# include sub dir makefile
include $(call all-makefiles-under,$(LOCAL_PATH))
