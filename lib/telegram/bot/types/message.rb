module Telegram
  module Bot
    module Types
      class Message < Base
        attr_accessor :chat

        attribute :message_id, Integer
        attribute :from, User
        attribute :date, Integer
        attribute :forward_from, User
        attribute :forward_date, Integer
        attribute :reply_to_message, Message
        attribute :text, String
        attribute :audio, Audio
        attribute :document, Document
        attribute :photo, Array[PhotoSize]
        attribute :sticker, Sticker
        attribute :video, Video
        attribute :contact, Contact
        attribute :location, Location
        attribute :new_chat_participant, User
        attribute :left_chat_participant, User
        attribute :new_chat_title, String
        attribute :new_chat_photo, Array[PhotoSize]
        attribute :delete_chat_photo, Boolean
        attribute :group_chat_created, Boolean

        def chat=(value)
          @chat =
          if value.key?('username')
            User.new(value)
          elsif value.key?('title')
            GroupChat.new(value)
          end
        end
      end
    end
  end
end
