class UserMailer < ApplicationMailer

def message_user(user, compose)
    @user = user
    @compose = compose
mail(:reply_to => compose.email, :to => user.email, :subject => compose.subject)
end
end