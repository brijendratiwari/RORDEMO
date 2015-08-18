class AddProtocolToSettings < ActiveRecord::Migration
  def change
    add_column :settings, :protocol, :string
  end
end
