json.array! @employees do |employee|
  json.employee employee, :email, :fname, :lname
  json.company employee.company, :title
end
