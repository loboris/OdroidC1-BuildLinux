
echo "Creating \"boot.ini\""

cat > $_bootd << _EOF_
ODROIDC-UBOOT-CONFIG

# Possible screen resolutions
# Uncomment only a single Line! The line with setenv written.
# At least one mode must be selected.

# setenv m "vga"          	# 640x480
# setenv m "480p"         	# 720x480
# setenv m "576p"         	# 720x576
# setenv m "800x480p60hz" 	# 800x480
# setenv m "800x600p60hz" 	# 800x600
# setenv m "1024x600p60hz"	# 1024x600
# setenv m "1024x768p60hz"	# 1024x768
# setenv m "1360x768p60hz" 	# 1360x768
# setenv m "1366x768p60hz"	# 1366x768
# setenv m "1440x900p60hz"	# 1440x900
# setenv m "1600x900p60hz"	# 1600x900
# setenv m "1680x1050p60hz"	# 1680x1050
# setenv m "720p"         	# 720p 1280x720
# setenv m "800p"         	# 1280x800
# setenv m "sxga"         	# 1280x1024
# setenv m "1080i50hz"          # 1080I@50Hz
# setenv m "1080p24hz"          # 1080P@24Hz
# setenv m "1080p50hz"          # 1080P@50Hz
setenv m "1080p"                # 1080P@60Hz
# setenv m "1920x1200"    	# 1920x1200

# HDMI DVI Mode Configuration
setenv vout_mode "hdmi"
# setenv vout_mode "dvi"

# HDMI BPP Mode: 16, 24 or 32
setenv m_bpp "16"

# HDMI Hotplug Force (HPD)
# 1 = Enables HOTPlug Detection
# 0 = Disables HOTPlug Detection and force the connected status
setenv hpd "0"

# CEC Enable/Disable (Requires Hardware Modification)
# 1 = Enables HDMI CEC
# 0 = Disables HDMI CEC
setenv cec "0"


# UHS Card Configuration
# Uncomment the line below to __DISABLE__ UHS-1 MicroSD support
# This might break boot for some brand models of cards.
setenv disableuhs "disableuhs"


# Disable VPU (Video decoding engine, Saves RAM!!!)
# 0 = disabled
# 1 = enabled
setenv vpu "0"

# Disable HDMI Output (Again, saves ram!)
# 0 = disabled
# 1 = enabled
setenv hdmioutput "1"

# Default Console Device Setting
# setenv condev "console=ttyS0,115200n8"              # on serial port
# setenv condev "console=tty0"                        # on display (HDMI)
setenv condev "console=ttyS0,115200n8 console=tty0"  # on both

###########################################
if test "\${hpd}" = "0"; then setenv hdmi_hpd "disablehpd=true"; fi
if test "\${cec}" = "1"; then setenv hdmi_cec "hdmitx=cecf"; fi


# Set Linux partition UUID
setenv linuuid "$ext4uuid"


# Boot Arguments
setenv bootargs "root=UUID=\${linuuid} rootwait ro \${condev} no_console_suspend vdaccfg=0xa000 logo=osd1,loaded,0x7900000,720p,full dmfc=3 cvbsmode=576cvbs hdmimode=\${m} m_bpp=\${m_bpp} vout=\${vout_mode} \${disableuhs} \${hdmi_hpd} \${hdmi_cec}"

# Booting
$_ul1
$_ul2
$_ul3
fdt addr 21800000

if test "\${vpu}" = "0"; then fdt rm /mesonstream; fdt rm /vdec; fdt rm /ppmgr; fi

if test "\${hdmioutput}" = "0"; then fdt rm /mesonfb; fi

bootm 0x21000000 0x22000000 0x21800000
_EOF_
