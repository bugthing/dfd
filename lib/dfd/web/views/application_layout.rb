module Dfd
  module Web
    module Views
      class ApplicationLayout
        include Hanami::Layout

        def javascript
          raw %(<script src="/path/to/script.js"></script>)
        end
      end
    end
  end
end
