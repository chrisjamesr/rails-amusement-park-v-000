class User < ActiveRecord::Base
  has_many :rides
  has_many :attractions, :through => :rides
  has_secure_password
  # validates :password, :presence => true


  def mood
    if nausea > happiness
      return "sad"
    elsif happiness > nausea
      return "happy"
    elsif happiness == nausea
      return "so so"
    end
  end

end
