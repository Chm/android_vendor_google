LOCAL_PATH := $(call my-dir)

.PHONY: gms_base
gms_base:

.PHONY: gms_gmail
gms_gmail: gms_base

.PHONY: gms_maps
gms_maps: gms_base

.PHONY: gms_market
gms_market: gms_base

.PHONY: gms_voicesearch
gms_voicesearch: gms_base

$(ALL_PREBUILT): gms_base gms_gmail gms_maps gms_market

# include sub dir makefile
include $(call all-makefiles-under,$(LOCAL_PATH))
