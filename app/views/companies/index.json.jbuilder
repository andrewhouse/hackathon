json.array!(@companies) do |company|
  json.extract! company, :id, :title
  json.employees company.employees do |employee|
    json.employee employee, :email, :fname, :lname, :company_id
    json.folders employee.folders do |folder|
      json.folder folder, :title, :description, :employee_id, :created_at, :updated_at, :size
      json.items folder.items do |item|
        json.item item, :title, :created_at, :record_file_name, :record_content_type, :record_file_size, :record_updated_at
      end
    end
  end
end
