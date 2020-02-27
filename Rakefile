require_relative 'config/application'
require 'rom-sql'
require 'rom/sql/rake_task'

module Tasks
  module DB
    class Setup

      include Rake::DSL

      def initialize
        namespace :db do
          task :setup do
            setup_db
          end
        end
      end

      private

      def setup_db
        Dfd::Application.start(:db)
        ROM::SQL::RakeSupport.env = ROM.container(Dfd::Application['db.config']) do |config|
          config.gateways[:default].use_logger(Logger.new($stdout))
        end
      end
    end
  end
end

Tasks::DB::Setup.new
