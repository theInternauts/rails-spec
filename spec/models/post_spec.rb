require 'spec_helper'

describe Post do
  let(:valid_attributes) { {title: 'New mega post!', content: 'A great story'} }
  let(:post) { Post.new(valid_attributes) }
  it "title should be automatically titleized before save" do
    expect {
      post.save
    }.to change { post.title }.to('New Mega Post!')
  end

  it "post should be unpublished by default" do
    post = Post.create(valid_attributes)
    expect(post.is_published).to be_false
  end

  # a slug is an automatically generated url-friendly
  # version of the title
  it "slug should be automatically generated" do
    expect { post.save }.to change { post.slug }.to("new-mega-post")
  end
end
