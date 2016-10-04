class Contact < ActiveRecord::Base
  validates :name, :email, :user_id, presence: true
  validate :check_duplicate_contact

  def check_duplicate_contact
    if Contact.find_by(user_id: user_id, email: email)
      errors.add(:duplicate_contact, "that email is already used")
    end
  end

  has_many :contact_shares,
    primary_key: :id,
    foreign_key: :contact_id,
    class_name: :ContactShare,
    dependent: :destroy

  belongs_to :owner,
    primary_key: :id,
    foreign_key: :user_id,
    class_name: :User

  has_many :shared_users,
    through: :contact_shares,
    source: :shared_with_user

end
