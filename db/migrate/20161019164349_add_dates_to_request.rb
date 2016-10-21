class AddDatesToRequest < ActiveRecord::Migration
  def change
    add_column :requests, :dates, :string, array: true
  end
end
