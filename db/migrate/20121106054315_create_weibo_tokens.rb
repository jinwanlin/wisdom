class CreateWeiboTokens < ActiveRecord::Migration
  def change
    create_table :weibo_tokens do |t|
      t.string :token
      t.string :account_id

      t.timestamps
    end
  end
end
