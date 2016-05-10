class HomeController < ApplicationController
    layout "grayscale"

    def index 
        if user_signed_in?
            redirect_to :controller=> 'dashboard', :action => 'index'
        end
    end 
    
end