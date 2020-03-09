describe "Guest and user" do

  let(:user) { create(:user) }
  let(:game) { create(:game) }

  describe "Sign Up" do

    let!(:user) { create(:user) }

    scenario "Successfully" do
      visit root_path
      click_link "Sign Up"
      fill_in "user[login]", with: "tokphil"
      fill_in "user[password_confirmation]", with: "qwerty"
      fill_in "user[password]", with: "qwerty"
      click_button "Create"
      expect(page).to have_content("You have created an account")
    end

    scenario "Not successfully" do
      visit root_path
      click_link "Sign Up"
      fill_in "user[login]", with: "philtok"
      fill_in "user[password_confirmation]", with: "qwerty"
      fill_in "user[password]", with: "qwerty"
      click_button "Create"
      expect(page).to have_content("Maybe account with this login is already taken")
    end
  end

  describe 'Sign In' do
    scenario "Successfully" do
      visit root_path
      click_link "Sign In"
      fill_form(:user, { login: user.login, password: user.password })
      click_button "Sign In"
      expect(page).to have_content("You logged in")
    end

    scenario "Not successfully" do
      visit root_path
      click_link "Sign In"
      fill_form(:user, { login: user.login, password: user.password + "12321" })
      click_button "Sign In"
      expect(page).to have_content("Login or password are wrong")
    end

    scenario "Not successfully" do
      visit root_path
      click_link "Sign In"
      fill_form(:user, { login: user.login + "1", password: user.password })
      click_button "Sign In"
      expect(page).to have_content("Login or password are wrong")
    end
  end

  scenario "not get in admin panel" do
    page.set_rack_session(user_id: user.id)
    visit admin_root_path
    expect(page).to have_content("You do not have access")
  end

  describe "Review for a game" do

    let!(:user) { create(:user) }

    scenario "Leave successfully" do
      page.set_rack_session(user_id: user.id)
      visit game_path(game)
      click_link "Add review"
      fill_in "Review", with: FFaker::Lorem.sentence(2)
      click_button "Leave"
      expect(page).to have_content("Review created")
    end

    scenario "Edit successfully" do
      page.set_rack_session(user_id: user.id)
      visit game_path(game)
      click_link "Add review"
      fill_in "Review", with: FFaker::Lorem.sentence(2)
      click_button "Leave"
      click_link "Edit"
      fill_in "Review", with: FFaker::Lorem.sentence(2)
      click_button "Update"
      expect(page).to have_content("Review updated")
    end

    scenario "Delete successfully" do
      page.set_rack_session(user_id: user.id)
      visit game_path(game)
      click_link "Add review"
      find("div#rating-form")
      fill_in "Review", with: FFaker::Lorem.sentence(2)
      click_button "Leave"
      click_link "Delete"
      expect(page).to have_content("Review deleted")
    end
  end
end

describe "Admin" do
  let(:admin) { create(:admin) }
  let!(:game) { create(:game) }

  scenario "get in admin panel" do
    page.set_rack_session(user_id: admin.id)
    visit admin_root_path
    expect(page).to have_content("admin panel")
  end

  scenario "create new game" do
    page.set_rack_session(user_id: admin.id)
    visit admin_root_path
    click_link "Add new game"
    fill_form(:game, { name: "Scythe", description: "Scythe description", image: "Scythe image" })
    click_button "Create"
    expect(page).to have_content("Game added")
  end

  scenario "get game catalog" do
    page.set_rack_session(user_id: admin.id)
    visit admin_games_path
    expect(page).to have_content('BoardGameName')
  end
end
