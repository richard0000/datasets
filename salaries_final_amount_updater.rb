CSV.open('salaries_updated.csv', "wb") do |csv_out|
  puts '--- Starting CSV parse ---'
  CSV.foreach('salaries.csv', headers: true) do |row|
    basic_salary = row[0]
    category = row[1]
    absences = row[2]
    children = row[3]
    category_amount = case category
      when 'A'
        1000
      when 'B'
        800
      when 'C'
        600
      when 'D'
        400
      when 'E'
        200
      else
        0
    end
    extra_price = absences.eql?(0) ? 1000 : 0
    family_salary = children.to_i * 1000
    row[4] = basic_salary.to_i + category_amount + extra_price + family_salary

    csv_out << row 
    print '.'
  end
end