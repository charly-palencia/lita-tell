
module Lita
  module Handlers
    class Tell < Handler
      route(/^tell "(.+)" to (.+)/) do |response|
        message, recipient = response.matches.first
        user = Lita::User.fuzzy_find(recipient)
        room = Lita::Room.fuzzy_find(recipient)
        response.reply_in_room(user, room, message)
        response.reply("Your message has been sent")
      end
    end

    Lita.register_handler(Tell)
  end
end
