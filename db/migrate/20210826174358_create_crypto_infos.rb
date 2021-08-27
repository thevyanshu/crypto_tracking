class CreateCryptoInfos < ActiveRecord::Migration[6.1]
  def change
    create_table :crypto_infos do |t|
      t.string :label
      t.string :name
      t.float :low
      t.float :high
      t.float :volume
      t.float :sell
      t.float :buy
      t.float :last


      t.timestamps
    end
  end
end
