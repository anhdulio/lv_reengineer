# Price changes overtime
class Price < ApplicationRecord
  belongs_to :product
  validates_numericality_of :price, only_integer: true, greater_than: 0, message: 'should be positive integer'
  validates_numericality_of :exchange_rate, only_integer: true, greater_than: 0, message: 'should be positive integer'

  def self.get_latest_exchange
    Price.order(:updated_date).first.exchange_rate
  end

  def self.get_l7d_exchange
    Price.where(updated_date: (Time.current - 7.days)..Time.current).average(:exchange_rate).to_i
  end

end
