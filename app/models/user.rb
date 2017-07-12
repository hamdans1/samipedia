class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  has_many :wikis
  
  after_initialize {self.role ||=  :standard}
  
  devise :database_authenticatable, :registerable,
<<<<<<< HEAD
         :recoverable, :rememberable, :trackable, :validatable, :confirmable
=======
         :recoverable, :rememberable, :trackable, :validatable
         
  enum role: [:standard, :premium, :admin]
>>>>>>> user-story-5
end
