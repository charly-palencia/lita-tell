module Lita
  class Response
    def_delegators :message, :reply_in_room
  end
end
