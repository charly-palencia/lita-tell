module Lita
  module Interactors
    class CreateSource
      attr_reader :recipient, :message, :error

      def initialize(recipient, message)
        @recipient = recipient.gsub(/@|#/, '')
        @message = message
      end

      def perform
        source
        self
      end

      def source
        Lita::Source.new(user: user, room: room)
      rescue ArgumentError => e
        @error = e.message
      end

      def success?
        error.nil?
      end

      private

      def user
        @user ||= Lita::User.fuzzy_find(recipient)
      end

      def room
        @room ||= Lita::Room.find_by_name(recipient)
      end
    end
  end
end
