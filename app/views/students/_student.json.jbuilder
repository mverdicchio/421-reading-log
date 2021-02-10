json.extract! student, :id, :name, :birthplace, :favorite_song, :created_at, :updated_at
json.url student_url(student, format: :json)
