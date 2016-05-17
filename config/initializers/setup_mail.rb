ActionMailer::Base.smtp_settings = {
    :address => "smtp.gmail.com",
    :port => 587,
    :domain => "gmail.com",
    :user_name => "johndoe.adelphi",
    :password => "132435HH",
    :authentication => "plain",
    :enable_starttls_auto => true
    }