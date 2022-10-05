class Favorite < ApplicationRecord
  belongs_to :user
  belongs_to :book

  # 下記のコード追記
  validates_uniqueness_of :book_id, scope: :user_id
end
