class ContactShare < ActiveRecord::Base
  validates :user_id, :contact_id, presence: true
  validate :share_duplicate

  def share_duplicate
    if ContactShare.find_by(user_id: user_id, contact_id: contact_id)
      errors.add(:share_duplicate, "already shared this contact")
    end
  end

  belongs_to :shared_with_user,
  primary_key: :id,
  foreign_key: :user_id,
  class_name: :User

  belongs_to :contact

  has_one :owner,
  through: :contact,
  source: :owner
end
