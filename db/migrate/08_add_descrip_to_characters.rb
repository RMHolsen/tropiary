class AddDescripToCharacters < ActiveRecord::Migration[4.2]
    def change
        add_column :characters, :descrip, :text
    end 
end 