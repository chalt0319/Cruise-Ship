class CreateCaptains < ActiveRecord::Migration[5.2]
  def change
    create_table :captains do |t|
      t.string :name
      t.string :password_digest
      t.string :secret_phrase

      t.timestamps
    end
  end
end
