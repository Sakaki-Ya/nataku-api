class CreateUsedTokens < ActiveRecord::Migration[6.0]
  def change
    create_table :used_tokens do |t|
      t.string :jti

      t.timestamps
    end
  end
end
