class Incident < ApplicationRecord
    has_many :apologies
    has_many :users, through: :apologies
    accepts_nested_attributes_for :apologies

    def apologized?(user)
        !!self.apologies.find{|apology| apology.user_id == user.id}
    end
end
