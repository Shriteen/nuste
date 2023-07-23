# nuste
Components for a cool fish configuration 🔥

This repository includes some fish functions which allow creating some
cool fun stuff!

### random_emoji ###
This displays a random emoji from the list defined within the file
based on exit status passed to it. It displays some positive emoji if
argument is success, negative in case of non-success.

This is designed to be used in the prompt. This could be called from
the fish_prompt function with exit status of previous command as the
argument.

### places_emoji ###
This displays the predefined emoji if the present working directory
matches certain predefined path. You may edit the cases to add or
update additional paths.

This is designed to be used in the prompt. This may be called from the
fish_prompt function.

## Install instructions ##
Place the fish files in `~/.config/fish/conf.d/`. These are just
definitions of functions and will have no effect unless called from
interactive shell, shell scripts or other config files.

## Suggested usage ##
The prompt can be modified by overriding the fish_prompt function. Add the
following function in `~/.config/fish/config.fish`. Following is an
example based on slight modification of the default prompt.

``` fish
function fish_prompt --description 'Custom prompt based on code from default prompt'
    set -l last_pipestatus $pipestatus
    set -lx __fish_last_status $status # Export for __fish_print_pipestatus.
    set -l normal (set_color normal)
    set -q fish_color_status
    or set -g fish_color_status red

    # Color the prompt differently when we're root
    set -l color_cwd $fish_color_cwd
    set -l suffix ']'
    if functions -q fish_is_root_user; and fish_is_root_user
        if set -q fish_color_cwd_root
            set color_cwd $fish_color_cwd_root
        end
        set suffix '#'
    end

    # Write pipestatus
    # If the status was carried over (if no command is issued or if `set` leaves the status untouched), don't bold it.
    set -l bold_flag --bold
    set -q __fish_prompt_status_generation; or set -g __fish_prompt_status_generation $status_generation
    if test $__fish_prompt_status_generation = $status_generation
        set bold_flag
    end
    set __fish_prompt_status_generation $status_generation
    set -l status_color (set_color $fish_color_status)
    set -l statusb_color (set_color $bold_flag $fish_color_status)
    set -l prompt_status (__fish_print_pipestatus "[" "]" "|" "$status_color" "$statusb_color" $last_pipestatus)

    echo -n -s (prompt_login)' ' (set_color $color_cwd) (places_emoji)" " (prompt_pwd) $normal (fish_vcs_prompt) $normal " "$prompt_status " "(random_emoji $last_pipestatus)"" $suffix " "
end

```

Note the calls to functions in last line. Also, the suffix is changed
here from '>' to ']' for aesthetic purpose. You may use any suffix of
your preference.

## Disclaimer ##
This is made available to you under GPLv3, you can use, modify and
redistribute under the terms of license.✨

This design is made for my personal use and is opinionated. Design
modifications of your preference should be made into your fork — No
Pull requests accepted. Although, PRs fixing bugs in intended use case
are welcome 🙂.
