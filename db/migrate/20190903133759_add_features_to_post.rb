class AddFeaturesToPost < ActiveRecord::Migration[5.2]
  def change
    add_column :posts, :features, :text
  end
end
