class CreateQuoteTags < ActiveRecord::Migration[6.0]
  def change
    create_table :quote_tags do |t|
      t.references :quote, null: false, index: true, foreign_key: true
      t.references :tag, null: false, index: true, foreign_key: true
      t.timestamps
    end
  end
end
