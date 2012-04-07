LOCAL_PATH := $(call my-dir)

.PHONY: GMS_BASE
GMS_BASE:

.PHONY: GMS_GMAIL
GMS_GMAIL: GMS_BASE

.PHONY: GMS_MAPS
GMS_MAPS: GMS_BASE

.PHONY: GMS_MARKET
GMS_MARKET: GMS_BASE

.PHONY: GMS_VOICESEARCH
GMS_VOICESEARCH: GMS_BASE

$(ALL_PREBUILT): GMS_BASE GMS_GMAIL GMS_MAPS GMS_MARKET

# include sub dir makefile
include $(call all-makefiles-under,$(LOCAL_PATH))