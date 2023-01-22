class Grade < ApplicationRecord
  validates :user_id, presence: true
  validates :code, :course, :points, :grade, presence: true

  validates :code, :course, uniqueness: true

  validates :grade, format: {with: /(?<=^|[\s,])(?:[A-D][-+]?|F)(?=[-+.]\B|[\s,]|$)/i , message: 'only allow american grades (A,B,C,D,F) '}

  belongs_to :user
end
