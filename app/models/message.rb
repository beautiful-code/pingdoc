class Message
  include Mongoid::Document

  field :sender_id, type: Integer
  field :sender_class, type: String
  field :msg, type: String
  validates_presence_of :sender_id, :sender_class, :msg

  embedded_in :conversation
end
