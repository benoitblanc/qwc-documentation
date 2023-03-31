all:

fetch:
	no=1; \
	for repo in qwc-map-viewer qwc-ogc-service qwc-feature-info-service qwc-fulltext-search-service qwc-legend-service qwc-permalink-service qwc-print-service  qwc-mapinfo-service qwc-data-service qwc-document-service qwc-elevation-service qwc-admin-gui qwc-registration-gui qwc-config-generator; do \
		echo "+++\nmenuTitle = \"$$repo\"\nweight = $$no\nchapter = false\n+++" >content/setup/services/$$repo.md; \
		curl -s -L https://github.com/qwc-services/$$repo/raw/master/README.md | sed '/^\[/d' >>content/setup/services/$$repo.md; \
		no=$$((no+1)); \
	done
	no=1; \
	for repo in qwc-db-auth qwc-ldap-auth; do \
		echo "+++\nmenuTitle = \"$$repo\"\nweight = $$no\nchapter = false\n+++" >content/setup/authentication/$$repo.md; \
		curl -s -L https://github.com/qwc-services/$$repo/raw/master/README.md | sed '/^\[/d' >>content/setup/authentication/$$repo.md; \
		no=$$((no+1)); \
	done
	no=1; \
	for file in requirements quick_start qwc_configuration plugins url_parameters startup_position server_side_configuration keeping_qwc_up_to_date developing; do \
		echo "+++\nmenuTitle = \"$$file\"\nweight = $$no\nchapter = false\n+++" >content/setup/viewer/$$file.md; \
		curl -s -L https://github.com/qgis/qwc2-demo-app/raw/master/doc/src/$$file.md | sed '/^\[/d' >>content/setup/viewer/$$file.md; \
		no=$$((no+1)); \
	done

schemas:
	# Convert JSON schemas to Markdown
	# https://github.com/coveooss/json-schema-for-humans
	no=1; \
	for repo in qwc-map-viewer qwc-ogc-service qwc-feature-info-service qwc-fulltext-search-service qwc-legend-service qwc-permalink-service qwc-print-service  qwc-mapinfo-service qwc-data-service qwc-document-service qwc-elevation-service qwc-ext-service qwc-admin-gui qwc-registration-gui qwc-config-generator; do \
		curl -s -o /tmp/schema.json -L https://github.com/qwc-services/$$repo/raw/master/schemas/$$repo.json; \
		echo "+++\ntitle = \"$$repo\"\nweight = $$no\n+++" >content/setup/configuration/$$repo.md; \
		.venv/bin/generate-schema-doc --config template_name=md /tmp/schema.json /tmp/schema.md; \
		cat /tmp/schema.md >>content/setup/configuration/$$repo.md; \
		no=$$((no+1)); \
	done
