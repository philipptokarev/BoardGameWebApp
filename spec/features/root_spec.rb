describe "Guest and user" do
  let(:user) { create(:user) }
  let(:game) { create(:game) }

  scenario "try to sign up" do
    visit root_path
    click_link "Sign Up"
    fill_in "user[login]", with: "philtok"
    fill_in "user[password_confirmation]", with: "qwerty"
    fill_in "user[password]", with: "qwerty"
    click_button "Create"
    expect(page).to have_css('h1', text: 'philtok', visible: true)
  end

  scenario "try to sign in" do
    visit root_path
    click_link "Sign In"
    fill_form(:user, { login: user.login, password: user.password })
    click_button "Sign In"
    expect(page).to have_css('h1', text: user.login, visible:true)
  end

  scenario "try not to get in admin panel" do
    visit root_path
    click_link "Sign In"
    fill_in "Login", with: user.login
    fill_in "Password", with: user.password
    click_button "Sign In"
    visit admin_root_path
    expect(page).to have_content("You do not have access")
  end

  scenario "try to leave review for game" do
    visit root_path
    click_link "Sign In"
    fill_form(:user, { login: user.login, password: user.password })
    click_button "Sign In"
    visit game_path(game)
    click_link "Add review"
    find("div#rating-form")
    fill_in "Review", with: FFaker::Lorem.sentence(2)
    click_button "Leave"
    expect(page).to have_content("Review created")
  end

  scenario "try to edit review for game" do
    visit root_path
    click_link "Sign In"
    fill_form(:user, { login: user.login, password: user.password })
    click_button "Sign In"
    visit game_path(game)
    click_link "Add review"
    find("div#rating-form")
    fill_in "Review", with: FFaker::Lorem.sentence(2)
    click_button "Leave"
    click_link "Edit"
    find("div#rating-form")
    fill_in "Review", with: FFaker::Lorem.sentence(2)
    click_button "Update"
    expect(page).to have_content("Review updated")
  end

  scenario "try to delete review for game" do
    visit root_path
    click_link "Sign In"
    fill_form(:user, { login: user.login, password: user.password })
    click_button "Sign In"
    visit root_path
    visit game_path(game)
    click_link "Add review"
    find("div#rating-form")
    fill_in "Review", with: FFaker::Lorem.sentence(2)
    click_button "Leave"
    click_link "Delete"
    expect(page).to have_content("Review deleted")
  end
end

describe "Admin" do
  let(:admin) { create(:admin) }
  let(:game) { create(:game) }

  scenario "try to get in admin panel" do
    visit root_path
    click_link "Sign In"
    fill_form(:user, { login: admin.login, password: admin.password })
    click_button "Sign In"
    visit admin_root_path
    expect(page).to have_content("admin panel")
  end

  scenario "try to create new game" do
    visit root_path
    click_link "Sign In"
    fill_form(:user, { login: admin.login, password: admin.password })
    click_button "Sign In"
    click_link "Admin panel"
    click_link "Add new game"
    fill_form(:game, { name: "Scythe", description: "Scythe description", image: "Scythe image" })
    click_button "Create"
    expect(page).to have_content("Game added")
  end

  scenario "get game catalog" do
    visit root_path
    click_link "Sign In"
    fill_form(:user, { login: admin.login, password: admin.password })
    click_button "Sign In"
    click_link "Admin panel"
    click_link "Add new game"
    fill_form(:game, { name: "Scythe", description: "Scythe description", image: "Scythe image" })
    click_button "Create"
    visit admin_games_path
    find("table")
    expect(page).to have_css('td', text: 'Scythe', visible: true)
  end
end
