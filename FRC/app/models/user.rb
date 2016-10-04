class User < ActiveRecord::Base
  validates :username, presence: true

  has_many :owned_contacts,
    primary_key: :id,
    foreign_key: :user_id,
    class_name: :Contact,
    dependent: :destroy

  has_many :owned_shared_contacts,
    through: :owned_contacts,
    source: :contact_shares,
    dependent: :destroy

  has_many :contact_shares_with,
    primary_key: :id,
    foreign_key: :user_id,
    class_name: :ContactShare,
    dependent: :destroy

  has_many :shared_contacts,
    through: :contact_shares_with,
    source: :contact
end
