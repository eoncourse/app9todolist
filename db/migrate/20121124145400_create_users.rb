class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username
      t.string :first_name
      t.string :last_name
      t.string :password
      t.date :date_of_birth
      t.string :security_question
      t.string :security_answer
      t.boolean :active
      t.boolean :admin

      t.timestamps
    end
  end
end
