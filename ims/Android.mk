# Copyright (C) 2020 Paul Bouchara
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

include $(CLEAR_VARS)
LOCAL_MODULE := libimsmedia_jni
LOCAL_SRC_FILES := ims/$(LOCAL_MODULE).so
LOCAL_MODULE_CLASS := SHARED_LIBRARIES
LOCAL_MODULE_TAGS := optional
LOCAL_MULTILIB := 64
LOCAL_MODULE_SUFFIX := .so
include $(BUILD_PREBUILT)

include $(CLEAR_VARS)
LOCAL_MODULE := libimscamera_jni
LOCAL_SRC_FILES := ims/$(LOCAL_MODULE).so
LOCAL_MODULE_CLASS := SHARED_LIBRARIES
LOCAL_MODULE_TAGS := optional
LOCAL_MULTILIB := 64
LOCAL_MODULE_SUFFIX := .so
include $(BUILD_PREBUILT)

include $(CLEAR_VARS)
LOCAL_MODULE := ims
LOCAL_SRC_FILES := ims/ims.apk
LOCAL_CERTIFICATE := platform
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_CLASS := APPS
LOCAL_MODULE_SUFFIX := .apk
LOCAL_SHARED_LIBRARY := libimscamera_jni libimsmedia_jni
LOCAL_PRIVILEGED_MODULE := true
include $(BUILD_PREBUILT)

include $(SONY_CLEAR_VARS)
LOCAL_MODULE := ims_symlinks
LOCAL_MODULE_PATH := $(TARGET_OUT_VENDOR)

# IMS Symlinks
SONY_SYMLINKS := \
    /system/lib64/libimscamera_jni.so:system/priv-app/ims/lib/arm64/libimscamera_jni.so \
    /system/lib64/libimsmedia_jni.so:system/priv-app/ims/lib/arm64/libimsmedia_jni.so

include $(SONY_BUILD_SYMLINKS)
