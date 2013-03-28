class CreateSubscriptions < ActiveRecord::Migration
  def change
    create_table :subscriptions do |t|
      t.references :user
      t.references :listener
      t.text :repo_ids
      t.timestamps
    end
  end

end
