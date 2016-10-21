class CreateRequests < ActiveRecord::Migration
  def change
    create_table :requests do |t|
      t.datetime :date
      t.string :ip_address

      t.timestamps null: false
    end
  end
end
