class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :handle
    end
  end
end
