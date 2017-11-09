class Conversation < ActiveRecord::Base
  belongs_to :repair
  belongs_to :sender, :foreign_key => :sender_id, class_name: 'User'
  belongs_to :recipient, :foreign_key => :recipient_id, class_name: 'User'
  has_many :messages, dependent: :destroy

  validates_uniqueness_of :sender_id, :scope => [:recipient_id, :repair_id]
  
  scope :between, -> (sender_id,recipient_id,repair_id) do
    where("(conversations.sender_id = ? AND conversations.recipient_id = ? AND conversations.repair_id = ?) OR (conversations.sender_id = ? AND conversations.recipient_id = ? AND conversations.repair_id = ?)", sender_id, recipient_id, repair_id, recipient_id, sender_id, repair_id)
  end
end