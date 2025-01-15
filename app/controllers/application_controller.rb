class ApplicationController < ActionController::Base
    helper_method :current_user
    
    private
        def current_user
            if session[:login_name]
                User.find_by(uid: session[:login_name])
            end
        end
    helper_method :current_cart
    private
        def current_cart
            if session[:cart_id]
                cart = Cart.find(session[:cart_id])
            else
                cart = Cart.create
                session[:cart_id] = cart.id
            end
            cart
        end
end
