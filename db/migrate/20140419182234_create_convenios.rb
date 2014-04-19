class CreateConvenios < ActiveRecord::Migration
  def change
    create_table :convenios do |t|
      t.string :numeroconvenio
      t.string :uf
      t.string :codigosiafi
      t.string :nomemunicipio
      t.string :situacaoconvenio
      t.string :numerooriginal
      t.string :objetoconvenio
      t.string :codigoorgaosuperior
      t.string :nomeorgaosuperior
      t.string :codigoconcedente
      t.string :nomeconcedente
      t.string :codigoconvenente
      t.string :nomeconvenente
      t.string :tipoenteconvenente
      t.string :valorconvenio
      t.string :valorliberado
      t.string :datapublicacao
      t.string :datainiciovigencia
      t.string :datafimvigencia
      t.string :valorcontrapartida
      t.string :dataultimaliberacao
      t.string :valorultimaliberacao

      t.timestamps
    end
  end
end
