install:
	install main main_gui_network /usr/local/bin
	which dialog >/dev/null 2>&1 || yum -y install dialog /usr/local/bin
	which xinetd >/dev/null 2>&1 || yum -y install xinetd
	which nc >/dev/null 2>&1 || yum -y install nc
	grep -q "`cat main.services`" /etc/services || cat main.services >> /etc/services
	install main.xinetd /etc/xinetd.d/main
	/etc/init.d/xinetd restart
	

