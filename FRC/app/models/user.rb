class User < ActiveRecord::Base
  validates :username, presence: true

  has_many :contacts,
    primary_key: :id,
    foreign_key: :user_id,
    class_name: :Contact

    
end
