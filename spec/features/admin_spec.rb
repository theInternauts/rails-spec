require 'spec_helper'

feature 'Admin panel' do
  let(:post) { Post.create( title: "Hello world!", content: "Lorem ipsum dolor sit amet", is_published: true) }
  context "on admin homepage" do
    it "can see a list of recent posts" do
      visit admin_posts_url
      page.should have_content "Welcome to the admin panel!"
    end
    it "can edit a post by clicking the edit link next to a post" do
     visit admin_post_url(post.id)
     find_link('Edit').click
     page.should have_content "Edit " + post.title
    end
    it "can delete a post by clicking the delete link next to a post" do
      visit admin_posts_url
      find_link('Delete').click
      page.should have_content "Published: false"
    end
    it "can create a new post and view it" do
       visit new_admin_post_url

       expect {
         fill_in 'post_title',   with: "Hello world!"
         fill_in 'post_content', with: "Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat."
         page.check('post_is_published')
         click_button "Save"
       }.to change(Post, :count).by(1)

       page.should have_content "Published: true"
       page.should have_content "Post was successfully saved."
     end
  end

  context "editing post" do
    it "can mark an existing post as unpublished" do
      pending
      page.should have_content "Published: false"
    end
  end

  context "on post show page" do
    it "can visit a post show page by clicking the title"
      pending
    it "can see an edit link that takes you to the edit post path"
      pending
    it "can go to the admin homepage by clicking the Admin welcome page link"
      pending
  end
end
