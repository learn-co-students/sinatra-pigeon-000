class CreatePigeons < ActiveRecord::Migration
  def change
    create_table :pigeons do |t|
      t.string :name
      t.string :color
      t.string :lives
      t.string :gender
    end
  end
end