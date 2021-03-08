class Apology < ApplicationRecord
  belongs_to :user
  belongs_to :incident
end
