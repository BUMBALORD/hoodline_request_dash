class ChangeResourceDatesToArray < ActiveRecord::Migration
  def change
    change_column :requests, :dates, :string, array: true, default: []
  end
end
