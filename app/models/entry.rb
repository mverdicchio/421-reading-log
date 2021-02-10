class Entry < ApplicationRecord
    validates :book_title, presence: true
  validates :pages, presence: true
end
