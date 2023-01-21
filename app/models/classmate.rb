class Classmate < ApplicationRecord
  validates :user_id, presence: true
  validates :first_name, :last_name, :email, :phone, presence: true

  validates :email, format: {with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i , message: 'only allows real emails with @'}

  validates :phone, format: { with: /([6-9]|1[0-3])/,
                                    message: "only allows numbers with a length between 6 and 13" }
  # validates :email, :phone, uniqueness: true

  belongs_to :user
  validates_uniqueness_of :email, :phone, scope: :user_id

end
