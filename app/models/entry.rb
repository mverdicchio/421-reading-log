class Entry < ApplicationRecord
    validates :book_title, presence: true
    validates :pages, presence: true, length: { minimum: 1 }
    has_one :student_id
end
