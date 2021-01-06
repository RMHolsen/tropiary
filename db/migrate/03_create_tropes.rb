class CreateTropes < ActiveRecord::Migration[4.2]
    def change
        create_table :tropes do |t|
            t.string :name
            t.integer :character_id
            t.integer :novel_id
        end 
    end 
end 