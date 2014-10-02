json.array!(@albums) do |album|
  json.extract! album, :id, :title, :release_date, :band_id
  json.url album_url(album, format: :json)
end
