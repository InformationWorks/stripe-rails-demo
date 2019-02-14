Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "landing#index"

  # Web
  get "/checkout" => "payments#checkout", as: :checkout
  post "/proceed-to-pay" => "payments#proceed_to_pay", as: :proceed_to_pay
  post "/order-processed" => "payments#order_processed", as: :order_processed

end
