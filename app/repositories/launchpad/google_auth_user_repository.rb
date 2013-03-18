module Launchpad
  module GoogleAuthUserRepository
    def self.create(*args)
      auth = args.fetch(0)
      GoogleAuthUser.create!(
        identifier_url: auth.fetch('uid'),
        email: auth.fetch('info').fetch('email'),
        first_name: auth.fetch('info').fetch('first_name'),
        last_name: auth.fetch('info').fetch('last_name'))
    end

    def self.find_or_create(*args)
      auth = args.fetch(0)
      user = GoogleAuthUserRepository.find(auth.fetch('uid'))
      user.is_a?(NullUser) ? GoogleAuthUserRepository.create(auth) : user
    end

    def self.find(id)
      if id.class == Fixnum
        GoogleAuthUser.find_by_id(id)
      else
        GoogleAuthUser.find_by_identifier_url(id)
      end || NullUser.new
    end
  end
end
