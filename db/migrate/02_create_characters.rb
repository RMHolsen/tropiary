class CreateCharacters < ActiveRecord::Migration
    def change 
        create_table :characters |c|
            c.string :name
            #c.string :novel
            c.integer :novel_id
        end 
    end 
end 