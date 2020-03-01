# frozen_string_literal: true

ROM::SQL.migration do
  change do
    create_table :donors do
      primary_key :id
      column :name, String
      column :nhs_number, String

      column :created_at, DateTime, null: false
      column :updated_at, DateTime, null: false

      index :nhs_number, unique: true
    end
  end
end
