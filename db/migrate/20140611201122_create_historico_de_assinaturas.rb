class CreateHistoricoDeAssinaturas < ActiveRecord::Migration
  def change
    create_table :historico_de_assinaturas do |t|
      t.references :assinatura, index: true
      t.timestamps
    end
  end
end
