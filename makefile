prefix			= /usr
exec_prefix		= ${prefix}
bindir			= ${exec_prefix}/sbin
exec_prefix		= ${prefix}
sysconfdir		= /etc
datarootdir		= ${prefix}/share

####################################################################################
PACKAGE_NAME	= orange-pi-fan-control
PACKAGE_VERSION	= 1.0.0
					

all:

install: FILES
	systemctl daemon-reload
	systemctl enable ${PACKAGE_NAME}.service
	systemctl start ${PACKAGE_NAME}.service

FILES: DIRS
	install ${PACKAGE_NAME}.sh	$(DESTDIR)$(bindir)/$(PACKAGE_NAME).sh
	cp ${PACKAGE_NAME}.service	$(DESTDIR)$(sysconfdir)/systemd/system/${PACKAGE_NAME}.service

DIRS:
	mkdir -p $(DESTDIR)$(bindir)
	mkdir -p $(DESTDIR)$(sysconfdir)/systemd/system/
