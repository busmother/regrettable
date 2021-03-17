class Incident < ApplicationRecord
    has_many :apologies, inverse_of: :incident
    has_many :users, through: :apologies
    validates :name, presence: :true
    accepts_nested_attributes_for :apologies, allow_destroy: true

    def apologized?(user)
        !!self.apologies.find{|apology| apology.user_id == user.id}
    end

    def apology_users_count
        users = self.apologies.map do |apology|
            apology.user
        end
        users.uniq.count
    end

    def apologies_count
        self.apologies.count
    end
end
