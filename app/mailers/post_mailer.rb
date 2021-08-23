  class PostMailer < ApplicationMailer
    
    def welcome_send(user)	
      @user = user
      mail to: user.email , subject: "Welcome to my Application", from: 'rishabhlodhi9@gmail.com' 
    end
  end
