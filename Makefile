.PHONY: all build clean

build-and-deploy:
	- make build
	- make deploy

format:
	- nix-shell --command "./bin/format.bash"

build:
	- make format
	- mkdir -p ./build
	- nix-shell --command "nickel export --format yaml src/dashboard/main.ncl > ./build/dashboard.yaml"
	- ./bin/add_button_card_templates.bash
	- nix-shell --command "nickel export --format yaml src/homeassistant/main.ncl > ./build/homeassistant.yaml"
	- nix-shell --command "nickel export --format yaml src/scenes/main.ncl > ./build/scenes.yaml"

deploy:
	- scp -r ./build/*.yaml NoverMewenn:/var/lib/home-assistant/generated