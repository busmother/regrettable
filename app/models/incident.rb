class Incident < ApplicationRecord
    has_many :apologies
    has_many :users, through: :apologies
end
