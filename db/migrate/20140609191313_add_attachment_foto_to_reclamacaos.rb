class AddAttachmentFotoToReclamacaos < ActiveRecord::Migration
  def self.up
    change_table :reclamacaos do |t|
      t.attachment :foto
    end
  end

  def self.down
    drop_attached_file :reclamacaos, :foto
  end
end
