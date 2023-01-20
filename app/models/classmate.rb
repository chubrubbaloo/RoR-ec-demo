class Classmate < ApplicationRecord
  validates :user_id, presence: true
  validates :first_name, :last_name, :email, :phone, presence: true
  # validates :email, :phone, uniqueness: true

  belongs_to :user
  validates_uniqueness_of :email, :phone, scope: :user_id

end
