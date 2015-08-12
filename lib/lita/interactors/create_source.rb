module Lita
  module Interactors
    class CreateSource
      attr :recipient
      attr_reader :error

      def self.perform(recipient)
        new(recipient).source
      end

      def initialize(recipient)
        @recipient = recipient
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
        error.nil? ? true : false
      end

      private

      def user
        @user ||= Lita::User.fuzzy_find(recipient)
      end

      def room
        @room ||= Lita::Room.fuzzy_find(recipient)
      end
    end
  end
end
