class AddExchangeRateToPrice < ActiveRecord::Migration[5.0]
  def change
    add_column :prices, :exchange_rate, :integer
  end
end
