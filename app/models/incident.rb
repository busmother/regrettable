class Incident < ApplicationRecord
    has_many :apologies
    has_many :users, through: :apologies

    def apologized?(user)
        !!self.apologies.find{|apology| apology.user_id == user.id}
    end
end
