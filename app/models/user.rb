class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :posts , dependent: :destroy 
  has_many :comments , dependent: :destroy 
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
    
  after_create :welcome_send

  def welcome_send
  	#byebug
    PostMailer.welcome_send(self).deliver_now  
  end         
end
