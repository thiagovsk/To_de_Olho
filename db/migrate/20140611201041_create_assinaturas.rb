class CreateAssinaturas < ActiveRecord::Migration
  def change
    create_table :assinaturas do |t|
      t.references :usuario, index: true
      t.references :abaixo_assinado, index: true

      t.timestamps
    end
  end
end
