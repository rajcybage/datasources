class AddhstoreTocsvImport < ActiveRecord::Migration
  def change
    execute "CREATE EXTENSION hstore"
  	add_column :csv_imports, :csv_values, :hstore
  end
end
