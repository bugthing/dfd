module Dfd
  module Web
    Router = Hanami::Router.new do
      root to: Controllers::Root::Index
      post "/donors", to: Controllers::Donors::Create
    end
  end
end
