#### remind

- Default password: none
- The upstream is openwrt official, authentic, some packages are taken from third parties
- Built-in some usb wireless ac network card and gigabit wired network card, check the config folder for details
- If you need to add a special package, please add it in the following file after fork
    - scripts/01_customize_packages.sh
    - config/*

#### branch

| Version   |x86<br>x86/generic|
|-----------|:-------------------:|
| 22.03.0   |       &check;       |
| 21.02.3   |       &check;       |

#### List of third-party applications

| application        |x86<br>x86/generic|
|-------------|:----------------:|
|ADBYBY Plus +|      &check;     |
| AutoCore    |      &check;     |
| cpufreq     |                  |
| FullCone NAT|      &check;     |
| OpenClash   |      &check;     |
| Scheduled restart | &check; |
| Internet time control | &check; |
| free memory | &check; |
| Automount | &check; |

#### TODO

- [ ] Consider opkg feeds, reduce firmware size so it can be installed on demand

#### grateful

- [![coolsnowwolf](https://img.shields.io/badge/Lede-Lean-orange.svg?style=flat&logo=appveyor)](https://github.com/coolsnowwolf/lede)
- [![Lienol](https://img.shields.io/badge/OpenWrt-Lienol-orange.svg?style=flat&logo=appveyor)](https://github.com/Lienol/openwrt)
- [![CTCGFW](https://img.shields.io/badge/OpenWrt-CTCGFW-orange.svg?style=flat&logo=appveyor)](https://github.com/immortalwrt/immortalwrt)
