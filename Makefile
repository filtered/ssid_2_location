INSTALL_PATH?=/usr/local/bin
CONFIG_PATH?=/Users/${USER}/.config/ssid_2_location
GREP?=/usr/bin/grep
SSID_MAP?=
LAUNCH_AGENT_PLIST_LOCATION=/Users/${USER}/Library/LaunchAgents

ALL=install

install:
	@echo "Installing executable in ${INSTALL_PATH}"
	install -d ${INSTALL_PATH}
	install -m755 ssid_2_location ${INSTALL_PATH}
	@echo "Installing Launch Agent"
	launchctl unload ${LAUNCH_AGENT_PLIST_LOCATION}/com.ssid_2_location.plist
	install -d ${LAUNCH_AGENT_PLIST_LOCATION}
	install -m644 com.ssid_2_location.plist ${LAUNCH_AGENT_PLIST_LOCATION}
	@echo "Installing config in ${CONFIG_PATH}"
	install -d ${CONFIG_PA
	install config ${CONFIG_PATH}
ifdef SSID_MAP
#	if [ `$(GREP) -c "$(SSID_MAP)" $(CONFIG_PATH)/config` -eq 0 ]; then
	@echo "Updating config with '${SSID_MAP}'"
	echo ${SSID_MAP} >> ${CONFIG_PATH}/config;
#	fi;
endif
	launchctl load ${LAUNCH_AGENT_PLIST_LOCATION}/com.ssid_2_location.plist
