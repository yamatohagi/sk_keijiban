class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|
      t.string :name
      t.string :service_id
      t.string :service_url
      t.string :service_type
      t.string :title
      t.string :text
      t.string :password
      t.string :display_color
      t.timestamps
    end
  end
end
