class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

   #validations
   validates :firstname, :lastname, presence: true

   has_many :products, dependent: :destroy
   has_many :favorites, dependent: :destroy

   # Finds a user
   scope :find_user, -> (id) { where(['id=?', id]) }

end
