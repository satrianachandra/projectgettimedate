install: main_gui_network-id.mo
	install main main_gui_network /usr/local/bin
	which dialog >/dev/null 2>&1 || yum -y install dialog /usr/local/bin
	which xinetd >/dev/null 2>&1 || yum -y install xinetd
	which nc >/dev/null 2>&1 || yum -y install nc
	grep -q "`cat main.services`" /etc/services || cat main.services >> /etc/services
	install main.xinetd /etc/xinetd.d/main
	install main_gui_network-id.mo /usr/share/locale/id/LC_MESSAGES/main_gui_network.mo
	/etc/init.d/xinetd restart
	
main_gui_network.pot: main_gui_network
	xgettext -o main_gui_network.pot -L Shell main_gui_network

main_gui_network-id.mo: main_gui_network-id.po
	msgfmt -o main_gui_network-id.mo main_gui_network-id.po
