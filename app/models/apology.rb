class Apology < ApplicationRecord
  belongs_to :user
  belongs_to :incident, inverse_of: :apologies
  has_many :forgivenesses
  has_many :users, through: :forgivenesses
  validates :body, length: {minimum: 50} 
  validates :incident, presence: :true
  validates :user_id, presence: :true
  scope :long_apology, -> {where("LENGTH(body) > 2000")}
  scope :newest_apologies, -> {order(created_at: :desc)}

  def forgiven?(user)
    !!self.forgivenesses.find{|forgiveness| forgiveness.user_id == user.id}
  end

  def forgives_count
      self.forgivenesses.count
  end

end
