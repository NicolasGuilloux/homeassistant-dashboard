.PHONY: all build clean

test:
	- nickel -f dashboard/dashboard.ncl export --format yaml

format:
	- ./bin/format.bash

build:
	- make format
	- mkdir -p ./build
	- nickel -f src/dashboard.ncl export --format yaml > ./build/dashboard.yaml
	- ./bin/add_button_card_templates.bash

deploy:
	- scp ./build/dashboard.yaml HomeAssistant:/config/nickel-dashboard.yaml

build-and-deploy:
	- make build
	- make deploy