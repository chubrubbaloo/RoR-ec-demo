class Classmate < ApplicationRecord
  validates :user_id, presence: true
  validates :first_name, :last_name, :email, :phone, presence: true

  validates :email, format: {with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i , message: 'only allows real emails with @'}

  validates :phone,   :presence => {:message => 'hello world, bad operation!'},
            :numericality => true,
            :length => { :minimum => 6, :maximum => 15 }
  # validates :email, :phone, uniqueness: true

  belongs_to :user
  validates_uniqueness_of :email, :phone, scope: :user_id

end
