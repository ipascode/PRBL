class AddAttachmentAvatarToMechanics < ActiveRecord::Migration
  def self.up
    change_table :mechanics do |t|

      t.attachment :avatar

    end
  end

  def self.down

    remove_attachment :mechanics, :avatar

  end
end
