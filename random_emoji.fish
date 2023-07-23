function random_emoji --description "Returns a random emoji based on exit status of previous command. Status of previous command is mandatory argument"
    # emojis to be displayed when previous command succeed or failed respectively
    # additional emojis can be added to the list
    # use emojis multiple times to increase their probability
    set -f positive_emojis 🙂 🙂 😇 🥰 😍 😍 🤩 🤯 😎 😎 💀 💀 👻 🤖 😺 😻 😻 💙 🩵 💯 🤟 👍 🙌 💪 💃 🐧 🐧 🐧 🚀 🛸 🌙 ⭐ 🌈 ⚡ 🔥 🔥 🔥 🔥 🎉 🏆 🎯 💻 🗿 🗿 🏁 
    set -f negative_emojis 🫠 🥲 🥲 🤫 🤐 😶 🙄 🫨 🤕 🤮 🥺 🥺 😭 🤬 👿 🙀 💔 💔 💥 🤌 👎 👎 🤦 🤷 🐞 🌋 ⚡ 📉 🚽 🧯 🪦 🚫 🚫 🚩

    # select random emoji based on status code
    if test $argv[1] -eq 0
       set -f emoji (random choice $positive_emojis)
    else
       set -f emoji (random choice $negative_emojis)
    end

    echo -n $emoji
end
