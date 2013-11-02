class Message
  include Mongoid::Document
  include Mongoid::Timestamps

  field :sender_id, type: Moped::BSON::ObjectId
  field :sender_class, type: String
  field :msg, type: String
  validates_presence_of :sender_id, :sender_class, :msg

  embedded_in :conversation

end
