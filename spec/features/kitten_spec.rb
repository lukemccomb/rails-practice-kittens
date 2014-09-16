require 'rails_helper'

feature 'Kittens' do
  before :each do
    user = create_user email: "user@example.com"
    Category.create!(name: "Cutest!")
    Kitten.create!(image: "http://i.imgur.com/tOzb0dUb.jpg")

    login(user)
  end

  scenario 'User can categorize kittens' do
    # wrap each image in a link with a class
    find(".kitten-link").click
    select "Cutest!", from: "categorization_category_id"
    click_on "Add Category"

    expect(page.current_path).to eq(root_path)
    within(".kitten") do
      expect(page).to have_content("Cutest!")
    end
  end

  scenario 'Categories appear alphabetized' do
    Category.create!(name: "Stupid")
    Category.create!(name: "Angry")
    find(".kitten-link").click
    select "Cutest!", from: "categorization_category_id"
    click_on "Add Category"

    expect(page.current_path).to eq(root_path)
    within(".kitten") do
      expect(page).to have_content("Cutest!")
    end

    find(".kitten-link").click
    select "Stupid", from: "categorization_category_id"
    click_on "Add Category"

    expect(page.current_path).to eq(root_path)
    within(".kitten") do
      expect(page).to have_content("Cutest! Stupid")
    end

    find(".kitten-link").click
    select "Angry", from: "categorization_category_id"
    click_on "Add Category"

    expect(page.current_path).to eq(root_path)
    within(".kitten") do
      expect(page).to have_content("Angry Cutest! Stupid")
    end
  end

  def login(user)
    visit root_path
    click_on "Login"
    fill_in "Email", with: user.email
    fill_in "Password", with: "password"
    click_on "Login"
  end

end