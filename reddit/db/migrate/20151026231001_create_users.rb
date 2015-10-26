class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string "email", :time => 50, :null => false
      t.column "password", :string, :limit=>30, :null =>false #you could add :default, :precision, :scale

      t.timestamps null: false
    end
  end
end
