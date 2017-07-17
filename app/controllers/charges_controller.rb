class ChargesController < ApplicationController

    def create
            customer = Stripe::Customer.create(
                email: current_user.email,
                card: params[:stripeToken]
            )
    
            charge = Stripe::Charge.create(
                customer: customer.id,
                amount: Amount.default,
                description: "BigMoney Membership - #{current_user.email}",
                currency: 'usd'
            )
        
            current_user.update_attribute(:role, 'premium')
    
            flash[:notice] = "Thanks for all the money, #{current_user.email}! Feel free to pay again."
            redirect_to root_path
    
            rescue Stripe::CardError => e
            flash[:alert] = e.message
            redirect_to new_charge_path
    end
    
    def new
        @stripe_btn_data = {
            key: "#{Rails.configuration.stripe[:publishable_key]}",
            description: "BigMoney Membership - #{current_user.email}",
            amount: Amount.default
        }
    end
    
    def update
        @user = User.find(params[:id])
        
        @user.update_attribute(:role, 'standard')
        @user.wikis.each do |wiki|
            wiki.update_attribute(:private, false)
        end
        
        flash[:alert] = "You have downgraded your membership. Your private posts are now available for public viewing."
        redirect_to root_path
    end
    
    
end