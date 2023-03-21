#!/bin/bash

# create directory
[[ ! -d package/new ]] && mkdir -p package/new

# Access Control
#cp -rf ../immortalwrt-luci/applications/luci-app-accesscontrol package/new/

# ADBYBY Plus +
svn export -q https://github.com/coolsnowwolf/luci/trunk/applications/luci-app-adbyby-plus package/new/luci-app-adbyby-plus
cp -rf ../immortalwrt-packages/net/adbyby package/new/

# arpbind
#cp -rf ../immortalwrt-luci/applications/luci-app-arpbind package/new/

# AutoCore, cp from YAOF
svn export -r 219750 -q https://github.com/immortalwrt/immortalwrt/branches/master/package/emortal/autocore package/new/autocore
sed -i '/"$threads"/d' package/new/autocore/files/x86/autocore
# grant getCPUUsage access
sed -i 's|"getTempInfo"|"getTempInfo", "getCPUBench", "getCPUUsage"|g' package/new/autocore/files/generic/luci-mod-status-autocore.json

# automount
cp -rf ../lede/package/lean/automount package/new/
cp -rf ../lede/package/lean/ntfs3-mount package/new/
# backport ntfs3 patches
patch -p1 -i ../patches/kernel-add-kmod-fs-ntfs3.patch
cp -rf ../lede/target/linux/generic/files-5.10 target/linux/generic/

# cpufreq
#cp -rf ../immortalwrt-luci/applications/luci-app-cpufreq package/new/

# DDNS
#cp -rf ../immortalwrt-packages/net/ddns-scripts_{aliyun,dnspod} package/new/

# dnsmasq
rm -rf package/network/services/dnsmasq
cp -rf ../immortalwrt/package/network/services/dnsmasq package/network/services/

# Filetransfer
#cp -rf ../immortalwrt-luci/applications/luci-app-filetransfer package/new/
cp -rf ../immortalwrt-luci/libs/luci-lib-fs package/new/

# FullCone nat for nftables
# patch kernel
cp -f ../immortalwrt/target/linux/generic/hack-5.10/952-net-conntrack-events-support-multiple-registrant.patch target/linux/generic/hack-5.10/
# fullconenat-nft
cp -rf ../immortalwrt/package/network/utils/fullconenat-nft package/network/utils/
# patch libnftnl
rm -rf package/libs/libnftnl
cp -rf ../immortalwrt/package/libs/libnftnl package/libs/
# patch nftables
rm -rf package/network/utils/nftables/
cp -rf ../immortalwrt/package/network/utils/nftables package/network/utils/
# patch firewall4
rm -rf package/network/config/firewall4
cp -rf ../immortalwrt/package/network/config/firewall4 package/network/config/
# patch luci
patch -d feeds/luci -p1 -i ../../../patches/fullconenat-luci.patch
# patch rtl8188eu
svn export -q https://github.com/ivanovborislav/rtl8188eu package/rtl8188eu
wget https://raw.githubusercontent.com/ivanovborislav/document/main/patch/20230314-k-v6.3-rc2.patch
patch -p1 < 20230314-k-v6.3-rc2.patch

# mbedtls
rm -rf package/libs/mbedtls
cp -rf ../immortalwrt/package/libs/mbedtls package/libs/

# OpenClash
#svn export -q https://github.com/vernesong/OpenClash/trunk/luci-app-openclash package/new/luci-app-openclash

# Realtek R8125, RTL8152/8153, RTL8192EU, RTL8188EU
cp -rf ../immortalwrt/package/kernel/{r8125,r8152,rtl8192eu,rtl8188eu} package/new/

# Release Ram
cp -rf ../immortalwrt-luci/applications/luci-app-ramfree package/new/

# default settings and translation
cp -rf ../default-settings package/new/

# fix include luci.mk
find package/new/ -type f -name Makefile -exec sed -i 's,../../luci.mk,$(TOPDIR)/feeds/luci/luci.mk,g' {} +
