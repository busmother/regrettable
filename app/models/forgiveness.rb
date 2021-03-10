class Forgiveness < ApplicationRecord
    belongs_to :user
    belongs_to :apology
    validates :user_id, uniqueness: {scope: :apology_id}

end
