class Admin < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable :recoverable,, :trackable, :validatable
  devise :database_authenticatable, :rememberable, :registerable
end
