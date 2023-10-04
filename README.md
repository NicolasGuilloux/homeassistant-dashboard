# HomeAssistant Dashboard

A HomeAssistant Dashboard written in Nickel.

I used Nickel so I don't have to deal with Yaml since I really dislike interacting with this language. I find it painful to use, and I was tired to test if it works at runtine, meaning refreshing the page and hoping that I didn't made a typo.

For more information, you can check the following link: https://community.home-assistant.io/t/what-about-nickel-dhall-lang/617667


## Structure

Some information about the decision I made for the folder structure and the build process.

1. The `lib` contains the type Contracts and the templates for the cards. In a nutshell, everything that is not designed by me.
2. The `src` contains the actual code to create the dashboard.
3. In the `bin` folder, there is a simple script to format all the nickel files in the folder, and another script that solves the issue described under.
4. I use SSH to copy the export to my HomeAssistant.

The Yaml used by HomeAssistant supports some custom functions such as `include_dir_merge_named`. 
Since Nickel does not support "raw" data, like passing a string without surrounding it with `"`, it must be added after Nickel export.
Hence the `add_button_card_templates.bash` to add the `button_card_templates` entry.