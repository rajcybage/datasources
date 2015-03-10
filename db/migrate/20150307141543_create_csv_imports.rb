class CreateCsvImports < ActiveRecord::Migration
  def change
    create_table :csv_imports do |t|
      t.text :values, array: true
      t.text :headers

      t.timestamps null: false
    end
  end
end
