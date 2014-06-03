install:
	install main main_gui_network /usr/local/bin
	which dialog >/dev/null 2>&1 || install dialog /usr/local/bin
	grep -q "`cat main.services`" /etc/services || cat main.services >> /etc/services
	install main.xinetd /etc/xinetd.d/main
	

