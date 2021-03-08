class Apology < ApplicationRecord
  belongs_to :user
  belongs_to :incident
  has_many :forgivenesses
  has_many :users, through: :forgivenesses
end
