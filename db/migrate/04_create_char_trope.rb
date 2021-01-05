class CreateCharTrope < ActiveRecord::Migration
    def change
        create_table :char_tropes do |x|
            x.integer :trope_id
            x.integer :character_id
        end 
    end 
end 