class Conversation
  include Mongoid::Document
  include Mongoid::Timestamps

  embeds_many :messages

  field :conversable_id, :type => Integer
  field :conversable_type, :type => String

  belongs_to :conversable, polymorphic: true
end
