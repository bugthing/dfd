module Dfd
  module Relations
    class Donors < ROM::Relation[:sql]
      schema(:donors, infer: true)
    end
  end
end
