module Lita
  module Handlers
    class Tell < Handler
      route(/^tell ["“](.+)["”] to (.+)/) do |response|
        message, recipient = response.matches.first
        interactor = Interactors::CreateSource.new(recipient).perform

        if interactor.success?
          response.reply_with_source(interactor.source, message)
          response.reply("Your message has been sent")
        else
          response.reply(interactor.error)
        end
      end
    end

    Lita.register_handler(Tell)
  end
end
