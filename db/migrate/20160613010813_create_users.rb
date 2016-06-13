class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.boolean :leader
      t.string :email
      t.string :password_digest
      t.string :phone
      t.string :address
      t.string :zip_code
      t.string :city
      t.string :state
      t.string :team
      t.string :career
      t.string :experience
      t.string :years_at_job
      t.text :bio

      t.timestamps null: false
    end
  end
end
