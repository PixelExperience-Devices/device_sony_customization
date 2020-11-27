# Copyright (C) 2019 AngeloGioacchino Del Regno <kholk11@gmail.com>
#
# ROM specific customization for Sony Open Devices
# PlatformConfig/BoardConfig overrides
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

CUST_PATH := device/sony/customization

# Compilers setup for Q
TARGET_KERNEL_CLANG_COMPILE := true
TARGET_CLANG_VERSION := r353983c

# Kernel inline building
TARGET_COMPILE_WITH_MSM_KERNEL := true
TARGET_KERNEL_SOURCE := kernel/sony/msm-4.14/kernel
TARGET_NEEDS_DTBOIMAGE := false

ifneq ($(filter nile ganges yoshino, $(SOMC_PLATFORM)),)
BOARD_KERNEL_SEPARATED_DTBO := false
else
BOARD_KERNEL_SEPARATED_DTBO := true
endif

TARGET_KERNEL_ADDITIONAL_FLAGS := \
	DTC_EXT=/usr/bin/dtc
