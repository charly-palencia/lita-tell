
module Lita
  module Handlers
    class Tell < Handler
      route(/^tell "(.+)" to (.+)/) do |response|
        message, recipient = response.matches.first
        response.reply_in_room(recipient, message)
        response.reply("Your message has been sent")
      end
    end

    Lita.register_handler(Tell)
  end
end
