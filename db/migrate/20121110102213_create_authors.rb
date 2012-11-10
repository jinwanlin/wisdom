class CreateAuthors < ActiveRecord::Migration
  def change
    create_table :authors do |t|
      t.string :name
      t.text :desc
      t.integer :age
      t.string :sex
      t.string :contact

      t.timestamps
    end
  end
end
