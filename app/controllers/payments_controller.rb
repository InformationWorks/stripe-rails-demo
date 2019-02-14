class PaymentsController < ApplicationController

  # GET /checkout
  def checkout
  end

  # POST /proceed-to-pay
  def proceed_to_pay
    @currency = params[:currency]
    @amount = params[:amount].to_i
  end

  # POST /order_processed
  # authenticity_token: 7aMp/X/902YIYiT9Pk1bNWDVc1in7MMNGwUvMLGP95+qh4KbYK+GRWwJjUx8piDoMlUz0b4nkWWgN4Z22TsYbw==
  # stripeToken: tok_1E3l5mI7kQt2QAQccakrXqA6
  # stripeTokenType: card
  # stripeEmail: you@example.com
  def order_processed

    # Set your secret key: remember to change this to your live secret key in production
    # See your keys here: https://dashboard.stripe.com/account/apikeys
    Stripe.api_key = Rails.application.credentials.stripe[:secret_key]

    # Token is created using Checkout or Elements!
    # Get the payment token ID submitted by the form:
    token = params[:stripeToken]

    @charge = Stripe::Charge.create({
        amount: params[:amount].to_i,
        currency: params[:currency],
        description: 'Example charge',
        source: token,
    })

  end

end