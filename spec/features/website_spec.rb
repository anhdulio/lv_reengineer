require 'rails_helper'

RSpec.feature 'Loc Van Website', type: :feature do
  scenario 'Homepage' do
    visit root_path
    expect(page).to have_selector('.header')
    expect(page).to have_selector('.slider')
    expect(page).not_to have_selector('.filter-bar')
    expect(page).to have_selector('.ldashboard')
    expect(page).to have_selector('.carousel')
    expect(page).to have_selector('.footer')
  end
  scenario 'Abouts Page' do
    visit abouts_path
    expect(page).to have_selector('.header')
    expect(page).to have_selector('.footer')
    expect(page).to have_selector('.filter-bar')
  end
  scenario 'Blogs Page' do
    visit blogs_path
    expect(page).to have_selector('.header')
    expect(page).to have_selector('.footer')
    expect(page).to have_selector('.filter-bar')
  end
end
