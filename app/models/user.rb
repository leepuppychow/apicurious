class User < ApplicationRecord

  def self.find_or_create_from_auth_hash(auth)
		where(uid: auth.uid).first_or_initialize.tap do |user|
			user.uid = auth.uid
			user.name = auth.info.name
      user.token = auth.credentials.token
			user.save
		end
	end

end
