json.array!(@folders) do |folder|
  json.extract! folder, :id, :title, :description
  json.employee folder.employee, :email, :fname, :lname
  json.url folder_url(folder, format: :json)
end
