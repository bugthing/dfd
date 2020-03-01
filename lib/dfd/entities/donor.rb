module Dfd
  class Donor < ROM::Struct
    def nhs_code
      "#{nhs_number}/#{name_as_code}"
    end

    def name_as_code
      name.gsub(/[^0-9a-z\-_\\\/]/i, '')
    end
  end
end
