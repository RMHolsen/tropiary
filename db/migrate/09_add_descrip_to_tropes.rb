class AddDescripToTropes < ActiveRecord::Migration[4.2]
    def change
        add_column :tropes, :descrip, :text
    end 
end 