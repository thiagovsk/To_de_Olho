class AddAttachmentAvatarToUsuarios < ActiveRecord::Migration
  def self.up
    change_table :usuarios do |t|
      t.attachment :avatar
    end
  end

end
