namespace :dev do
  task :fake_pc => :environment do
    posts = Post.all
    11.times do |x|
      20.times do
        post = posts.sample
        if CategoryPostsship.find_by(category_id: (x + 1), post_id: post.id)
          next
        else
          CategoryPostsship.create!(:category_id => (x + 1), :post_id => post.id)
        end
      end
    end
  end
end
