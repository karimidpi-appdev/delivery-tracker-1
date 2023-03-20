class CreatePackages < ActiveRecord::Migration[6.0]
  def change
    create_table :packages do |t|
      t.string :name
      t.integer :user_id
      t.date :arrive_on
      t.text :content
      t.string :status

      t.timestamps
    end
  end
end
