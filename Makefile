.PHONY: all build clean

format:
	- ./bin/format.bash

build:
	- make format
	- mkdir -p ./build
	- nickel -f src/dashboard/main.ncl export --format yaml > ./build/dashboard.yaml
	- ./bin/add_button_card_templates.bash
	- nickel -f src/homeassistant/main.ncl export --format yaml > ./build/homeassistant.yaml
	- nickel -f src/scenes/main.ncl export --format yaml > ./build/scenes.yaml

deploy:
	- scp ./build/*.yaml HomeAssistant:/config/generated/

build-and-deploy:
	- make build
	- make deploy