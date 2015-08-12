module Lita
  module Handlers
    class Tell < Handler
      route(/^tell (\S+) (.+)/) do |response|
        recipient, message = response.matches.first
        interactor = Interactors::CreateSource.new(recipient, message).perform
        send_message(response, interactor)
      end

      route(/^say ["“](.+)["”] to (\S+)/) do |response|
        message, recipient = response.matches.first
        interactor = Interactors::CreateSource.new(recipient, message).perform
        send_message(response, interactor)
      end

      def send_message(response, interactor)
        if interactor.success?
          response.reply_with_source(interactor.source, interactor.message)
          response.reply("Your message has been sent")
        else
          response.reply(interactor.error)
        end
      end
    end

    Lita.register_handler(Tell)
  end
end
