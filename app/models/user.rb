class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :apologies
  has_many :forgivenesses
  has_many :incidents, through: :apologies
  has_many :forgiven_apologies, through: :forgives
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
