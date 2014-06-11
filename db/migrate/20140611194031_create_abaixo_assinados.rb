class CreateAbaixoAssinados < ActiveRecord::Migration
  def change
    create_table :abaixo_assinados do |t|
      t.references :usuario, index: true
      t.string :titulo
      t.string :destinatario
      t.text :termo
      t.date :data
      t.references :convenio, index: true

      t.timestamps
    end
  end
end
