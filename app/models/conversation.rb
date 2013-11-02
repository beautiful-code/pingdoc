class Conversation
  include Mongoid::Document
  include Mongoid::Timestamps

  embeds_many :messages

end
