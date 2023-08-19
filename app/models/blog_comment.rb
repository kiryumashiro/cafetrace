class BlogComment < ApplicationRecord
  belongs_to :customer  #Comment.customerでコメントの所有者を取得
  belongs_to :blog  #Comment.blogでそのコメントがされた投稿を取得
end
