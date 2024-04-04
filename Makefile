.PHONY: all build clean

build-and-deploy:
	- make build
	- make deploy

format:
	- nix-shell --command "./bin/format.bash"

build:
	- make format
	- mkdir -p ./build
	- nix-shell --command "nickel -f src/dashboard/main.ncl export --format yaml > ./build/dashboard.yaml"
	- ./bin/add_button_card_templates.bash
	- nix-shell --command "nickel -f src/homeassistant/main.ncl export --format yaml > ./build/homeassistant.yaml"
	- nix-shell --command "nickel -f src/scenes/main.ncl export --format yaml > ./build/scenes.yaml"

deploy:
	- scp -r ./build/*.yaml NoverMewenn:/var/lib/home-assistant/generated