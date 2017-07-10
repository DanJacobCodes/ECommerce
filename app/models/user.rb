class User < ApplicationRecord
  has_one :account
  has_many :orders
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
