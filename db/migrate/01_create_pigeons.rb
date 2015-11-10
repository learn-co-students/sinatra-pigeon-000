# write your pigeon migration here
# look at the seed.rb file to see
# what columns to include

# remember to inherit from the correct ActiveRecord module
class CreatePigeons < ActiveRecord::Migration
  def change
  	create_table :pigeons do |t|
  	  t.string :name
  	  t.string :color
  	  t.string :gender
  	  t.string :lives
  	end
  end
end