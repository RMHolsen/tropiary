class CreateCharacters < ActiveRecord::Migration[4.2]
    def change 
        create_table :characters do |c|
            c.string :name
            c.integer :novel_id
        end 
    end 
end 