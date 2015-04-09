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
=======
# write your pigeon migration here
# look at the seed.rb file to see
# what columns to include

# remember to inherit from the correct ActiveRecord module