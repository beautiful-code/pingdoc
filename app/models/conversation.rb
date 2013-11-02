class Conversation
  include Mongoid::Document

  embeds_many :messages

end
