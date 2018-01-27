# write your pigeon migration here
# look at the seed.rb file to see
# what columns to include
class CreatePigeons < ActiveRecord::Migration
  def change
    create_table :pigeons do |p|
      p.string  :name
      p.string  :color
      p.string  :gender
      p.string  :lives
    end
  end
end
# remember to inherit from the correct ActiveRecord module
