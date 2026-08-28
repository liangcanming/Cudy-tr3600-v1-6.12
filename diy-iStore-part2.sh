#!/bin/bash
#
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part2.sh
# Description: OpenWrt DIY script part 2 (After Update Feeds)
#
# Copyright (c) 2019-2024 P3TERX <https://p3terx.com>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#

# =========================================================
# 修改默认 IP 地址（可选）
# =========================================================

# 将默认 IP 从 192.168.1.1 改为 192.168.10.1
# sed -i 's/192.168.1.1/192.168.10.1/g' package/base-files/files/bin/config_generate

# =========================================================
# 修改默认主机名（可选）
# =========================================================

# sed -i 's/OpenWrt/Cudy-TR3600/g' package/base-files/files/bin/config_generate

# =========================================================
# 修改默认时区（可选）
# =========================================================

# =========================================================
# 添加 iStore 源
# =========================================================

echo "📦 添加 iStore 源..."
echo "src-git istore https://github.com/linkease/istore;main" >> feeds.conf.default

# 设置默认LuCI主题为argon
sed -i 's/luci.main.theme=bootstrap/luci.main.theme=argon/' package/base-files/files/etc/config/luci
# 备份兼容写法，防止上面没匹配到
echo "uci set luci.main.theme='argon'" >> package/base-files/files/etc/uci-defaults/99-default-theme
echo "uci commit luci" >> package/base-files/files/etc/uci-defaults/99-default-theme
#