#!/bin/bash
#
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part2.sh
# Description: OpenWrt DIY script part 2 (After Update feeds)
#
# Copyright (c) 2019-2024 P3TERX <https://p3terx.com>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#

# Modify default IP
#sed -i 's/192.168.1.1/192.168.50.5/g' package/base-files/files/bin/config_generate

# Modify default theme
#sed -i 's/luci-theme-bootstrap/luci-theme-argon/g' feeds/luci/collections/luci/Makefile

# Modify hostname
#sed -i 's/OpenWrt/P3TERX-Router/g' package/base-files/files/bin/config_generate

# 修改默认 IP
CONFIG_FILE="package/base-files/files/bin/config_generate"
if [ -f "$CONFIG_FILE" ]; then
  if ! grep -q "192.168.1.254" "$CONFIG_FILE"; then
    sed -i 's/192\.168\.6\.1/192.168.1.254/g; s/192\.168\.1\.1/192.168.1.254/g' "$CONFIG_FILE"
    echo "IP 地址已更新为 192.168.1.254"
  else
    echo "IP 地址已是 192.168.1.254，无需修改"
  fi
else
  echo "警告：$CONFIG_FILE 不存在，跳过 IP 修改"
fi
