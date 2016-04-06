Sequel.migration do
  change do
    create_table :notifications do
      primary_key :id

      String :profile_ref_id, :null => false

      String :metadata, :null => false
      Boolean :seen, :null => false, :default => false

      String :kind, :null => false

      Time :created_at, :null => false
      Time :updated_at, :null => false
    end

    add_index :notifications, :profile_ref_id
  end
end
