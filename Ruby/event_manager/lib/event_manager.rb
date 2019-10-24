require 'csv'
require 'google/apis/civicinfo_v2'
require 'erb'
require 'date'

def clean_zipcode(zipcode)
  zipcode = zipcode.to_s
  zipcode.rjust(5, '0')[0..4]
end

def only_digits(number)
  number.scan(/\d+/).join('')
end

def clean_phone_number(phonenumber)
  number = only_digits(phonenumber)
  return number if number.length == 10
  if number.length <10
    return 'bad number'
  elsif number[0] = '1'
    return number[1..]
  end
  return 'bad number'

end

def time_targeting(regdate)
  time = DateTime.strptime(regdate,'%m/%d/%y %H:%M')
  time.hour
end

def week_targeting(regdate)
  time = DateTime.strptime(regdate,'%m/%d/%y %H:%M')
  time.wday
end

def legislator_by_zipcode(zipcode)
  civic_info = Google::Apis::CivicinfoV2::CivicInfoService.new
  civic_info.key = 'AIzaSyClRzDqDh5MsXwnCWi0kOiiBivP6JsSyBw'
  begin
    civic_info.representative_info_by_address(
      address: zipcode,
      levels: 'country',
      roles: ['legislatorUpperBody','legislatorLowerBody']
    ).officials
  rescue
    'You can find your representatives by visiting www.commoncause.org' +
      '/take-action/find-elected-officials'
  end
end

def save_thank_you_letters(id,form_letter)
  Dir.mkdir('output') unless Dir.exist? 'output'
  filename = "output/thanks_#{id}.html"

  File.open(filename, 'w') do |file|
    file.puts form_letter
  end
end


puts ' EventManager Initialized!'
template_letter = File.read 'form_letter.erb'
erb_template = ERB.new template_letter
popular_times = Hash.new(0)
popular_days = Hash.new(0)
contents = CSV.open 'event_attendees.csv', headers: true, header_converters: :symbol
contents.each do |row|

  id = row[0]
  puts clean_phone_number(row[:homephone])
  name = row[:first_name]
  zipcode = clean_zipcode(row[:zipcode])
  legislators = legislator_by_zipcode(zipcode)

  popular_times[time_targeting(row[:regdate])]+=1
  popular_days [week_targeting(row[:regdate])]+=1
  form_letter = erb_template.result(binding)
  save_thank_you_letters(id, form_letter)
end
puts popular_times
puts popular_days