json.array!(@clues) do |clue|
  json.extract! clue, :id, :name, :description
  json.url clue_url(clue, format: :json)
end
