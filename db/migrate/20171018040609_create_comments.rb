class CreateComments < ActiveRecord::Migration[5.1]
  def change
    create_table :comments do |t|
      t.string :nick
      t.text :content
      t.datetime :datetime
      t.references :post, foreign_key: true

      t.timestamps
    end
  end
end
