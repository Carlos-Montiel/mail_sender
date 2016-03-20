class AddFieldsToThing < ActiveRecord::Migration
  def change
    add_column :things, :email, :string
  end
end
