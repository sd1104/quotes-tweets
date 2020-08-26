class CreateQuotes < ActiveRecord::Migration[6.0]
  def change
    create_table :quotes do |t|
      t.string :title, null: false
      t.string :citation, null: false
      t.text :explanation, null: false
      t.references :user, null: false
      t.timestamps
    end
  end
end
