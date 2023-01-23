class Grade < ApplicationRecord
  validates :user_id, presence: true
  validates :code, :course, :points, :grade, presence: true

  validates_uniqueness_of :code, :course, scope: :user_id

  validates :points ,:numericality => true

  validates :grade, format: {with: /(?<=^|[\s,])(?:[A-D][-+]?|F)(?=[-+.]\B|[\s,]|$)/i , message: 'only allow american grades (A,B,C,D,F) '}

  belongs_to :user
end
