class CreateReclamacaos < ActiveRecord::Migration
  def change
    create_table :reclamacaos do |t|
      t.text :descricao
      t.references :convenio, index: true
      t.timestamps
    end
  end
end
