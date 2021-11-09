class AddGenreToNovels < ActiveRecord::Migration[4.2]
    def change
        add_column :novels, :genre_id, :integer
    end 
end 