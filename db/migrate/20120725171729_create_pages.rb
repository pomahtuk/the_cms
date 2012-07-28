class CreatePages < ActiveRecord::Migration
  def change
    create_table :pages do |t|
      t.integer :user_id

      t.string :title
      t.text   :description
      t.text   :raw_description
      t.text   :raw_content
      t.text   :content

      t.integer :parent_id
      t.integer :lft
      t.integer :rgt
      t.integer :depth

      t.timestamps
    end
  end
end
