class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :authentication_keys => [:username]
  attr_accessor :login
  has_attached_file :avatar, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/
  
  validates :username, :email, :firstname, :lastname, :role, presence: true
  validates :username, :email, uniqueness: {case_sensitive: false}

  def email_required?
    false
  end

  def email_changed?
    false
  end

def self.find_first_by_auth_conditions(warden_conditions)
  conditions = warden_conditions.dup
  if login = conditions.delete(:login)
    where(conditions).where(["lower(username) = :value OR lower(email) = :value", { :value => login.downcase }]).first
  else
    if conditions[:username].nil?
      where(conditions).first
    else
      where(username: conditions[:username]).first
    end
  end
end

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
