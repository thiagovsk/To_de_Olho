class AddAttibutesToConvenio < ActiveRecord::Migration
  def change

    add_column :reclamacaos, :convenio_id, :integer

  end
end
