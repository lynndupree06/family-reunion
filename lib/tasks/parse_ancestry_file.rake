namespace :parse do

  desc 'Parse ancestry data from GEDCOM file'
  task family_data: :environment do
    File.open('family.ged', 'r') do |f|
      current_detail = nil
      person = nil
      family = nil

      f.each_line do |line|
        index = line[0, 1]

        if index == '0'
          type, id = line.scan(/\@([A-Z])(\d*)\@/).flatten
          if type == 'P' && id.present?
            person = Person.find(id)
            person = Person.create(:id => id) if person.nil?
          elsif type == 'F' && id.present?
            family = Family.find(id)
            family = Family.create(:id => id) if family.nil?
          end
        elsif index == '1' && person.present?
          current_detail = get_details(line, person, family, nil)
        elsif index == '2' && person.present?
          get_details(line, person, family, current_detail)
        end
      end
    end
  end
end

def get_record_type(matches)
  case matches[0]
    when 'P'
      "Person - id: #{matches[1]}"
    when 'F'
      "Family - id: #{matches[1]}"
    else
      nil
  end
end

def get_details(line, person, family, current_detail)
  parts = line.split(' ')
  type = parts[1]
  description = line[parts[0].length + parts[1].length + 1, line.length]

  case type
    when 'BIRT'
      "Birthday"
    when 'DATE'
      if current_detail == 'Birthday'
        person.dob = description.strip unless description.nil?
        person.save!
      elsif current_detail == 'Marriage' && family.present?
        family.marriage_date = description.strip unless description.nil?
        family.save!
      end
    when 'PLAC'
      if current_detail == 'Birthday'
        person.dob_location = description.strip unless description.nil?
        person.save!
      elsif current_detail == 'Marriage' && family.present?
        family.marriage_location = description.strip unless description.nil?
        family.save!
      end
    when 'NAME'
      first_name, last_name = description.scan(/(.*)\s\/(.*)\//).flatten
      person.first_name = first_name.strip unless first_name.nil?
      person.last_name = last_name.strip unless first_name.nil?
      person.save!
    when 'SEX'
      person.gender = description.strip unless description.nil?
      person.save!
    when 'RESI'
      # puts "Reside - #{description}"
    when 'WIFE'
      type, id = line.scan(/\@([A-Z])(\d*)\@/).flatten
      family.wife_id = id
      family.save!
    when 'HUSB'
      type, id = line.scan(/\@([A-Z])(\d*)\@/).flatten
      family.husband_id = id
      family.save!
    when 'CHIL'
      type, id = line.scan(/\@([A-Z])(\d*)\@/).flatten
      Child.create!(:person_id => id, :family_id => family.id)
      ['Child', id]
    when '_FREL'
      if current_detail[0].present? && current_detail[0] == 'Child'
        child = Child.find_by(:person_id => current_detail[1])
        child.father_relation = description.strip unless description.nil?
        child.save!
      end
    when '_MREL'
      if current_detail[0].present? && current_detail[0] == 'Child'
        child = Child.find_by(:person_id => current_detail[1])
        child.mother_relation = description.strip unless description.nil?
        child.save!
      end
    when 'MARR'
      'Marriage'
    else
      ''
  end
end

