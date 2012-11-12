class CreateLaunchpadGoogleAuthUsers < ActiveRecord::Migration
  def change
    create_table :launchpad_google_auth_users do |t|
      t.string :email
      t.string :first_name
      t.string :last_name
      t.string :identifier_url
      t.timestamps
    end

    add_index :launchpad_google_auth_users, :identifier_url
  end
end
