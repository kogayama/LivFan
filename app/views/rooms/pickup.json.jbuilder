json.array! @books do |book|
  json.id book.id
  json.user_id book.user_id
  json.room_id book.room_id
  json.start_date book.start_date
  json.end_date book.end_date

end