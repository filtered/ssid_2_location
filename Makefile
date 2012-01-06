INSTALL_PATH?=/usr/local/bin
CONFIG_PATH?=/Users/${USER}/.config/ssid_2_location
GREP?=/usr/bin/grep
LAUNCH_AGENT_PLIST_LOCATION=/Users/${USER}/Library/LaunchAgents
SSID_MAP?=

ALL=install

install:
	@echo "Installing executable"
	install -d ${INSTALL_PATH}
	install -m755 ssid_2_location ${INSTALL_PATH}
	@echo "Installing Launch Agent"
	install -d ${LAUNCH_AGENT_PLIST_LOCATION}
	install -m644 com.ssid_2_location.plist ${LAUNCH_AGENT_PLIST_LOCATION}
	@echo "Installing config in ${CONFIG_PATH}"
	install -d ${CONFIG_PATH}
	install config ${CONFIG_PATH}
ifdef SSID_MAP
#	if [ `$(GREP) -c "$(SSID_MAP)" $(CONFIG_PATH)/config` -eq 0 ]; then
	@echo "Updating config with '${SSID_MAP}'"
	echo ${SSID_MAP} >> ${CONFIG_PATH}/config;
#	fi;
endif
	launchctl load "${LAUNCH_AGENT_PLIST_LOCATION}/com.ssid_2_location.plist"
