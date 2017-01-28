class AddAttachmentAvatarToBuses < ActiveRecord::Migration
  def self.up
    change_table :buses do |t|

      t.attachment :avatar

    end
  end

  def self.down

    remove_attachment :buses, :avatar

  end
end
