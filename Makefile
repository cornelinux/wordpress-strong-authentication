info:
	@echo "zip           - create a zip file for manually uploading"
	@echo "clean         - remove built stuff"


PLUGIN_NAME="strong_authentication"

zip:
	rm -fr ${PLUGIN_NAME}
	mkdir -p ${PLUGIN_NAME}
	cp README.md *.php ${PLUGIN_NAME}
	zip -r ${PLUGIN_NAME}.zip ${PLUGIN_NAME}

clean:
	rm ${PLUGIN_NAME}.zip
	rm -f *~
	rm -fr ${PLUGIN_NAME}
