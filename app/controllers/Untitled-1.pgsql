-- SELECT * FROM users;
SELECT * FROM posts;
-- SELECT * FROM comments;
-- user = User.create(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.')
-- user = User.create(name: 'Larry', photo: 'https://unsplash.com/es/fotos/WE6A_jLpZwQ', bio: 'Teacher from Wars.')
-- user = User.create(name: 'Carlos', photo: 'https://unsplash.com/es/fotos/RT3QngqeIEc', bio: 'Teacher from Hunger.')
-- user = User.create(name: 'Tommy', photo: 'https://unsplash.com/es/fotos/wqAuyugJIeU', bio: 'Teacher from Dreams.')
-- user = User.create(name: 'Brayan', photo: 'https://unsplash.com/es/fotos/Zdf3zn5XXtU', bio: 'Teacher from Heaven.')
-- user = User.create(name: 'Salamon', photo: 'https://unsplash.com/es/fotos/R11bppS4q8o', bio: 'Teacher from Hell.')
--    user_post1 = Post.create(author: user6, title: 'Hello', text: 'Post 1 user 6')
--    user_post2 = Post.create(author: user6, title: 'my', text: 'Post 2 user 6')
--    user_post3 = Post.create(author: user6, title: 'friend', text: 'Post 3 user 6')
--    Comment.create(post: user6_post1, author: user1, text: 'comment x post 1' )
--    Comment.create(post: user6_post2, author: user2, text: 'comment y post 2' )
--    Comment.create(post: user6_post3, author: user3, text: 'comment z post 3' )
<div class="bttn-box">
<button class="expand-bttn">
<%= link_to 'Go back', user_posts_path(@user) %>
</button>
</div>