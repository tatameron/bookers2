class Post < ApplicationRecord

belongs_to :user
validates :caption,length:{in:1..200}
validates :books_name,length:{minimum:1}

end
