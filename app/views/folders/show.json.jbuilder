json.folder @folder, :title, :description, :created_at, :updated_at
json.extract! @folder.employee, :email, :fname, :lname
json.items @folder.items, :record_file_name, :record_content_type, :record_file_size, :record_updated_at, :created_at, :title
