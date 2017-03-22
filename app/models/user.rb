class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :username, :email, :firstname, :lastname, :role, presence: true
  validates :username, :email, uniqueness: {case_sensitive: false}

  def self.import(file)
    CSV.foreach(file.path, headers: true) do |row|
     user_hash = row.to_hash
      user = User.where(username: user_hash["username"])

      if user.count == 1
       user.first.update_attributes(user_hash)
      else
        User.create! row.to_hash
      end # end if !mechanic.nil?
    end # end CSV.foreach
  end # end self.import(file)

  def self.to_csv(options = {})
  CSV.generate(options) do |csv|
    csv << column_names
    all.each do |product|
      csv << product.attributes.values_at(*column_names)
    end
  end
end

end
