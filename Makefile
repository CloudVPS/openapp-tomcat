OA_PREFIX=${CURDIR}/debian/openapp-tomcat
OP_PREFIX=${CURDIR}/debian/openpanel-openapp-mod-tomcat
OP_SOURCE=${CURDIR}/openpanel-openapp-mod-tomcat

install:
# bin
	mkdir -p $(PREFIX)/usr/bin
	cp openapp-tomcat-passwd $(PREFIX)/usr/bin
	mkdir -p $(PREFIX)/etc/lighttpd/conf-enabled
	cp etc/lighttpd/conf-enabled/tomcat.conf $(PREFIX)/etc/lighttpd/conf-enabled

	mkdir -p ${OP_PREFIX}/var/openpanel/modules/OpenAppTomcat.module
	mkdir -p ${OP_PREFIX}/var/openpanel/wallpaper
	mkdir -p ${OP_PREFIX}/var/openpanel/http/images
	install -m 755 ${OP_SOURCE}/action ${OP_PREFIX}/var/openpanel/modules/OpenAppTomcat.module/action
	cp ${OP_SOURCE}/module.xml ${OP_PREFIX}/var/openpanel/modules/OpenAppTomcat.module/module.xml
	cp ${OP_SOURCE}/*.png ${OP_PREFIX}/var/openpanel/modules/OpenAppTomcat.module/
#	cp ${OP_SOURCE}/tomcat.html ${OP_PREFIX}/var/openpanel/modules/OpenAppTomcat.module/
	mv ${OP_PREFIX}/var/openpanel/modules/OpenAppTomcat.module/logo.png ${OP_PREFIX}/var/openpanel/http/images/OpenPanelLogo.png
	cp ${OP_SOURCE}/wallpaper.jpg ${OP_PREFIX}/var/openpanel/wallpaper/default.jpg
	install -m 755 ${OP_SOURCE}/verify ${OP_PREFIX}/var/openpanel/modules/OpenAppTomcat.module/verify

build:
	mkmodulexml < ${OP_SOURCE}/module.def > ${OP_SOURCE}/module.xml
	convert -modulate 50,100,100 ${OP_SOURCE}/tomcat.png ${OP_SOURCE}/down_tomcat.png
	convert ${OP_SOURCE}/wallpaper.png ${OP_SOURCE}/wallpaper.jpg

uninstall:
# bin
	rm -rf $(OA_PREFIX)
	rm -rf ${OP_PREFIX}

clean:
	-echo "NOP"

 

