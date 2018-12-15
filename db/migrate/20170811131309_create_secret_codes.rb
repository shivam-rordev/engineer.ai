class CreateSecretCodes < ActiveRecord::Migration[5.0]
  def change
    create_table :secret_codes do |t|
    	t.string :code
    	t.integer :user_id
      t.timestamps
    end
  end
end
