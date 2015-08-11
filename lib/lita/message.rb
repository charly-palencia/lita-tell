module Lita
  class Message
    def reply_in_room(channel, *strings)
      source = Lita::Source.new(user: user, room: channel)
      @robot.send_messages(source, *strings)
    end
  end
end
