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
    expect(page).to have_content("philtok")
  end

  scenario "try to sign in" do
    visit root_path
    click_link "Sign In"
    fill_in "Login", with: user.login
    fill_in "Password", with: user.password
    click_button "Sign In"
    expect(page).to have_content("philtok")
  end

  scenario "try not to get in admin panel" do
    visit root_path
    click_link "Sign In"
    fill_in "Login", with: user.login
    fill_in "Password", with: user.password
    click_button "Sign In"
    visit admin_root_path
    expect(page).to have_content("home page")
  end

  scenario "try to leave review for game" do
    visit root_path
    click_link "Sign In"
    fill_in "Login", with: user.login
    fill_in "Password", with: user.password
    click_button "Sign In"
    visit game_path(game)
    click_link "Add review"
    fill_in "Review", with: "qwertyui wertyui ertyuiop"
    click_button "Leave"
    expect(page).to have_content("Review created")
  end

  scenario "try to edit review for game" do
    visit root_path
    click_link "Sign In"
    fill_in "Login", with: user.login
    fill_in "Password", with: user.password
    click_button "Sign In"
    visit game_path(game)
    click_link "Add review"
    fill_in "Review", with: "qwertyui op"
    click_button "Leave"
    click_link "Edit"
    fill_in "Review", with: "qwertyui wertyui ertyuiopqweqw"
    click_button "Update"
    expect(page).to have_content("Review updated")
  end

  scenario "try to delete review for game" do
    visit root_path
    click_link "Sign In"
    fill_in "Login", with: user.login
    fill_in "Password", with: user.password
    click_button "Sign In"
    visit root_path
    visit game_path(game)
    click_link "Add review"
    fill_in "Review", with: "qwertyui op"
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
    fill_in "Login", with: admin.login
    fill_in "Password", with: admin.password
    click_button "Sign In"
    visit admin_root_path
    expect(page).to have_content("admin panel")
  end

  scenario "try to create new game" do
    visit root_path
    click_link "Sign In"
    fill_in "Login", with: admin.login
    fill_in "Password", with: admin.password
    click_button "Sign In"
    click_link "Admin panel"
    click_link "Add new game"
    fill_in "game[name]", with: "Scythe"
    fill_in "game[description]", with: "Scythe description"
    fill_in "game[image]", with: "Scythe image"
    click_button "Create"
    expect(page).to have_content("Game added")
  end

  scenario "get game catalog" do
    visit root_path
    click_link "Sign In"
    fill_in "Login", with: admin.login
    fill_in "Password", with: admin.password
    click_button "Sign In"
    click_link "Admin panel"
    click_link "Add new game"
    fill_in "game[name]", with: "Scythe"
    fill_in "game[description]", with: "Scythe description"
    fill_in "game[image]", with: "Scythe image"
    click_button "Create"
    expect(page).to have_content("Scythe")
  end
end
