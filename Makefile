info:
	@echo "zip           - create a zip file for manually uploading"
	@echo "clean         - remove built stuff"
	@echo "svn	     - upload to wordpress hosted svn"


PLUGIN_NAME="strong_authentication"
SVNDIR="wordpress_strong_authentication"

zip:
	rm -fr ${PLUGIN_NAME}
	mkdir -p ${PLUGIN_NAME}
	cp README.md *.php ${PLUGIN_NAME}
	zip -r ${PLUGIN_NAME}.zip ${PLUGIN_NAME}

clean:
	rm ${PLUGIN_NAME}.zip
	rm -f *~
	rm -fr ${PLUGIN_NAME}
	rm -fr ${SVNDIR}

svn:
	rm -fr ${SVNDIR}
	mkdir ${SVNDIR}
	svn co http://plugins.svn.wordpress.org/strong-authentication ${SVNDIR}
	cp *.php ${SVNDIR}/trunk/
	cp readme.txt LICENSE AUTHORS ${SVNDIR}/trunk/
	(cd ${SVNDIR}; svn add trunk/*)
	(cd ${SVNDIR}; svn ci --username cornelinux)
	
