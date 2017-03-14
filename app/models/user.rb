class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  def self.import(file)
    CSV.foreach(file.path, headers: true) do |row|
     user_hash = row.to_hash
      user = User.where(lastname: user_hash["username"])

      if user.count == 1
       user.first.update_attributes(user_hash)
      else
        User.create! row.to_hash
      end # end if !mechanic.nil?
    end # end CSV.foreach
  end # end self.import(file)

end
