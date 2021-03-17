class Apology < ApplicationRecord
  belongs_to :user
  belongs_to :incident
  has_many :forgivenesses
  has_many :users, through: :forgivenesses
  validates :body, length: {minimum: 50}
  scope :long_apology, -> {where("LENGTH(body) > 2000")}
  #apologies = Apology.long_apology.sort { |x,y| x.body.length <=> y.body.length }.reverse
  scope :newest_apologies, -> {order(created_at: :desc)}

  def forgiven?(user)
    !!self.forgivenesses.find{|forgiveness| forgiveness.user_id == user.id}
  end

  def forgives_count
      self.forgivenesses.count
  end

  def first_forgive
    self.forgivenesses.first.user
  end
  
end
