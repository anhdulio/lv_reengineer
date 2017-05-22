require 'rails_helper'

RSpec.feature 'Loc Van Website', type: :feature do
  scenario 'Homepage' do
    visit '/'
    expect(page).to have_selector('.header')
    expect(page).to have_selector('.slider')
    expect(page).to have_selector('.price-quote')
    expect(page).to have_selector('.client')
    expect(page).to have_selector('.page-footer')
  end
end
