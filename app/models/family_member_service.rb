class FamilyMemberService
  def setup_family_member(details)
    index = details[0,1]
    type = details[2,4]
    description = details[6, line.length]

    if index == '0'
      puts "New Record"
      puts "------------------"
    elsif index == '1'
      puts "New Detail:"
    end
    puts "#{index}, #{type}, #{description}"
  end
end
