class DeviseCreateUsers < ActiveRecord::Migration
  def change
    create_table(:users) do |t|
      ## Database authenticatable
      t.string :email,              :null => false, :default => ""
      t.string :encrypted_password, :null => false, :default => ""
      
      # LabElves user attributes
      t.string :name, :null => false
      t.string :location, :null => false
      t.string :education, :null => false
      t.string :institution      
      t.string :link                      

      ## Recoverable (if forgot password)
      t.string   :reset_password_token
      t.datetime :reset_password_sent_at

      ## Rememberable (so user can stay logged in)
      t.datetime :remember_created_at

      ## Trackable (tracks login stats, meh)
      # t.integer  :sign_in_count, :default => 0
      # t.datetime :current_sign_in_at
      # t.datetime :last_sign_in_at
      # t.string   :current_sign_in_ip
      # t.string   :last_sign_in_ip

      ## Confirmable (sign-up email confirmations)
      t.string   :confirmation_token
      t.datetime :confirmed_at
      t.datetime :confirmation_sent_at
      t.string   :unconfirmed_email # Only if using reconfirmable

      ## Lockable (for locking an account)
      # t.integer  :failed_attempts, :default => 0 # Only if lock strategy is :failed_attempts
      # t.string   :unlock_token # Only if unlock strategy is :email or :both
      # t.datetime :locked_at

      ## Token authenticatable (for API requests)
      t.string :authentication_token

      t.timestamps
    end

    add_index :users, :email,                :unique => true
    add_index :users, :location
    add_index :users, :reset_password_token, :unique => true
    add_index :users, :confirmation_token,   :unique => true
    add_index :users, :authentication_token, :unique => true
    # add_index :users, :unlock_token,         :unique => true
  end
end
