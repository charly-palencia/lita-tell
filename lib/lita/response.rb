module Lita
  class Response
    def_delegators :message, :reply_with_source
  end
end
