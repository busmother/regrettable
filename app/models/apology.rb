class Apology < ApplicationRecord
  belongs_to :user
  belongs_to :incident
  has_many :forgivenesses
  has_many :users, through: :forgivenesses

  def forgiven?(user)
    !!self.forgivenesses.find{|forgiveness| forgiveness.user_id == user.id}
  end

def forgives_count
    self.forgivenesses.count
end
  
end
