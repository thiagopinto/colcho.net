class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :full_name
      t.string :email
      t.string :password
      t.string :location
      t.text :bio
<<<<<<< HEAD

      t.index :email, unique: true

=======
      t.index :email, unique: true
>>>>>>> 151a9b7a943a33b4f2d06e97e67685252d4822fa
      t.timestamps null: false
    end
  end
end
