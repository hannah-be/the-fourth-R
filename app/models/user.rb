class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :omniauthable,
         :recoverable, :rememberable, :trackable, :validatable
         
  has_one :profile, dependent: :destroy
  has_one :repairer, dependent: :destroy
  # has_one :repairer
  # has_many :items
  # has_many :addresses
end
