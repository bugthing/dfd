module Dfd
  module Web
    Router = Hanami::Router.new do
      post "/donors", to: Controllers::Donors::Create
    end
  end
end
