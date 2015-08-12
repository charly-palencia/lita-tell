module Lita
  class Message
    def reply_with_source(source, *strings)
      @robot.send_messages(source, *strings)
    end
  end
end
