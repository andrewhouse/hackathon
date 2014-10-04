json.array! @employees do |employee|
  json.employee employee, :email, :fname, :lname, :gravatar_url
  json.company employee.company, :title
end
