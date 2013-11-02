class Conversation
  include Mongoid::Document
  include Mongoid::Timestamps

  embeds_many :messages

  field :conversable_id, :type => Integer
  field :conversable_type, :type => String

  belongs_to :conversable, polymorphic: true

  def add_message actor, msg
    Message.create(:conversation => self, :sender_id => actor.id, :sender_class => actor.class.to_s, :msg => msg)
  end

  def as_json
    {
      :messages => messages
    }
  end

end
