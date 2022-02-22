class Book < ApplicationRecord

  belongs_to :user

  #バリデーションの設定
  validates :title, presence: true
  validates :body, presence: true, length: {maximum:200}

end
