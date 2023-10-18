#!/usr/bin/env bash

mv build/dashboard.yaml build/dashboard.yaml.tmp
echo "button_card_templates: !include_dir_merge_named \"../custom_components/ui_lovelace_minimalist/__ui_minimalist__/ulm_templates/\"" > build/dashboard.yaml
cat build/dashboard.yaml.tmp >> build/dashboard.yaml
rm build/dashboard.yaml.tmp