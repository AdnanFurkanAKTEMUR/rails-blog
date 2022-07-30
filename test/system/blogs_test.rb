require "application_system_test_case"

class BlogsTest < ApplicationSystemTestCase
  # test "visiting the index" do
  #   visit blogs_url
  #
  #   assert_selector "h1", text: "Blogs"
  # end

  setup do
    @blog = blogs(:first) # Reference to the first fixture quote
  end

  test "Creating a new blog" do
    visit blogs_path
    assert_selector "h1", text: "Blogs"

    click_on "New Blog"
    assert_selector "h1", text: "New Blog"

    fill_in "Name",	with: "Adnan Furkan AKTEMUR"
    click_on "Create Blog"

    assert_selector "h1", text: "Blogs"
    assert_text "Capybara Blogs"
  end

  test "Showing a blog" do
    visit blogs_path
    click_link @blog.name

    assert_selector "h1", text: @blog.name
  end

  test "Updating a blog" do
    visit blogs_path
    assert_selector "h1", text: "Blogs"

    click_on "Edit", match: :first
    assert_selector "h1", text: "Edit blog"

    fill_in "Name", with: "Updated blog"
    click_on "Update blog"

    assert_selector "h1", text: "Blog"
    assert_text "Updated blog"
  end

  test "Destroying a blog" do
    visit blogs_path
    assert_text @blog.name

    click_on "Delete", match: :first
    assert_no_text @blog.name
  end
end
