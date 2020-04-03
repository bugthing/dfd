module Dfd
  module Web
    Router = Hanami::Router.new do
      root to: Controllers::Root::Index
      post "/donors", to: Controllers::Donors::Create

      get "/auth/failure", to: Controllers::Session::Failure
      get "/auth/signout", to: Controllers::Session::Destroy
      get "/auth/:provider/callback", to: Controllers::Session::New
    end
  end
end
