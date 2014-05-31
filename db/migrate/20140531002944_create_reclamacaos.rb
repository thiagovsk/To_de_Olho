class CreateReclamacaos < ActiveRecord::Migration
  def change
    create_table :reclamacaos do |t|
      t.text :descricao

      t.timestamps
    end
  end
end
