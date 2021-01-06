class CreateNovels < ActiveRecord::Migration[4.2]
    def change
        create_table :novels do |n|
            n.string :title
            n.string :genre
            n.integer :word_count
            n.integer :trope_id
        end 
    end 
end 