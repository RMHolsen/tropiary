class AddSynopsisToNovels < ActiveRecord::Migration[4.2]
    def change
        add_column :novels, :synopsis, :text
    end 
end 