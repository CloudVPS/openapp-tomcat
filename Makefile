PREFIX=${CURDIR}/debian/openapp-tomcat

install:
# bin
	mkdir -p $(PREFIX)/etc/lighttpd/conf-enabled
	cp etc/lighttpd/conf-enabled/tomcat.conf $(PREFIX)/etc/lighttpd/conf-enabled

uninstall:
# bin
	rm -rf $(PREFIX)

clean:
	-echo "NOP"

 

