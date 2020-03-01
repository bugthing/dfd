module Dfd
  module Repos
    class DonorRepo < ROM::Repository[:donors]
      include Dependencies["container"]

      struct_namespace Dfd

      commands :create,
        use: :timestamps,
        plugins_options: {
          timestamps: {
            timestamps: %i[created_at updated_at],
          },
        }

      def all
        donors.to_a
      end
    end
  end
end
