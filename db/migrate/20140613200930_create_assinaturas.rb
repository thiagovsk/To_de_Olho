class CreateAssinaturas < ActiveRecord::Migration
  def change
    create_table :assinaturas do |t|
      t.references :usuario
      t.references :abaixo_assinado

      t.timestamps
    end
  end
end
