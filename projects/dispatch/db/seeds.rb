# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
IncidentType.delete_all
open("#{Rails.root}/db/incident_categories.txt") do |types|
    types.read.each_line do |data|
        type, severity = data.chomp.split(",")
        itype = IncidentType.new(name: type)
        itype.default_severity = severity
        itype.save!
    end
end

qform = { "custom" => 0, 
          "range" => 1, 
          "string" => 2, 
          "radio" => 3, 
          "checkbox" => 4,
          "check" => 4 
        }
IncidentQuestion.delete_all
main_hash = JSON.parse(File.read("#{Rails.root}/db/questions.json"))
main_hash.each do |key, value|
    itype = IncidentType.where(name: key).first
    value.each do |question|
        q = question["question"] 
        form = question["form"] 
        answer_array = question["answer"]
        if form == 'range'
            min_val = answer_array[0].to_i
            max_val = answer_array[1].to_i
            iquestion = IncidentQuestion.new(question: q,
                                             question_form: qform[form],
                                             min_val: min_val,
                                             max_val: max_val,
                                             incident_type_id: itype.id)
        else
            iquestion = IncidentQuestion.new(question: q,
                                             question_form: qform[form],
                                             min_val: 0,
                                             max_val: 0,
                                             incident_type_id: itype.id)
        end
        iquestion.save!
        setting = false
        if form == 'radio' or form == 'checkbox'
            answer_array.each do |answer|
                iqanswer = IncidentQuestionAnswer.new(incident_question_id: iquestion.id,
                                                      answer: answer,
                                                      default_answer: setting)
                iqanswer.save!
            end

        end
    end
end

User.delete_all
i = 0
admin = User.new(first_name: "admin", last_name: "admin", phone_number: "9999999990", email: 'admin@dispatch.com', password: 'password', password_confirmation: 'password', admin: true)
admin.save!

admin1 = User.new(first_name: "admin2", last_name: "admin2", phone_number: "9999999991", email: 'admin2@dispatch.com', password: 'password', password_confirmation: 'password', admin: true)
admin1.save!

admin2 = User.new(first_name: "admin3", last_name: "admin3", phone_number: "9999999992", email: 'admin3@dispatch.com', password: 'password', password_confirmation: 'password', admin: true)
admin2.save!

open("#{Rails.root}/db/employees.txt") do |person|
    fake_num = 0
    person.read.each_line do |data|
        if i >= 100
            break
        end
        i = i + 1
        first_name, last_name = data.chomp.split
        p = User.new(first_name: first_name, last_name: last_name)
        p.email = "#{first_name}" + '.' + "#{last_name}" + '@email.com'
        fake_num += 1;
        num_str = fake_num.to_s
        p.phone_number = '0'*(10 - num_str.length) + num_str
        p.password = 'password'
        p.save!
    end
end
locations = ["Aidekman Arts Center", "Alumnae Hall", "Anderson Hall", "Balch Arena Theater", "Ballou Hall", "Barnum Hall", "Bendetson Hall", "Braker Hall", "Bromfield-Pearson", "Bush Hall ", "Campus Center", "Carmichael Hall", "Cohen Auditorium", "Cousens Gym", "Curtis Hall", "Dewick-MacPhie Dining Hall", "Dowling Hall", "East Hall", "Eaton Hall & Computer Lab", "Eliot-Pearson", "Gantcher Center", "Goddard Chapel", "Granoff Family Hillel Center", "Granoff Music Center", "Halligan Hall", "Haskell Hall ", "Health Services", "Hill Hall", "Hillside Apartments", "Hodgdon Hall", "Houston Hall", "Jackson Gym", "Lane Hall", "Latin Way Apartments ", "Lewis Hall ", "Lincoln Filene Center", "Miller Hall", "Miner Hall", "Mugar Hall", "Olin Center for Language ", "Paige Hall", "Pearson Chemical Lab", "Performance Hanger", "Psychology Building", "Sophia Gordon Hall", "South Hall ", "Robinson Hall", "Science & Technology Center", "Tilton Hall ", "Tisch Library", "West Hall"]

names = ["Gruxis Vacuity", "Draexas The Darkmaster", "Bruwith The Decayer", "Xithas Graves", "Sazis The Abominable", "Sadrim The Rotting", "Totos The Renewer", "Toxhin The Resurrector", "Liowith The Tyrant", "Shothes The De-Composer", "Zadhir Bonecall", "Xewith Crow", "Braxith The Demise", "Stedrem Incarnate", "Zowix Crow", "Stawix Graves", "Kidrex The Darkmaster", "Bioshis Deathbloom", "Wraewix Deville", "Strocix Maleficum"]

rng = Random.new()
Incident.delete_all
1000.times do |x|
    # goes from 1 - 21, cannot have 0
    type_id = (x % 26) + 1
    incident = Incident.new(name: names.sample, 
                            severity: (1 + rand(10)), 
                            start_date: Time.at(
                                rand * 
                                (2.months.ago.to_f - Time.now.to_f) + 
                                Time.now.to_f), 
                            location: locations.sample, 
                            incident_type_id: type_id)
    incident.save!
    questions = IncidentQuestion.where(incident_type_id: type_id)
    questions.each do |q|
        if q.question_form == qform["radio"] or q.question_form == qform["checkbox"]
            answer = IncidentQuestionAnswer.where(incident_question_id: q.id).first
            a_id = answer.id
            response = ReportComment.new(incident_question_answer_id: a_id,
                                         incident_id: incident.id)

        elsif q.question_form == qform["range"]
            response = ReportCustomComment.new(incident_question_id: q.id,
                                               incident_id: incident.id,
                                               range_value: q.max_val)
       else
            response = ReportCustomComment.new(incident_question_id: q.id,
                                               incident_id: incident.id,
                                               answer: "You know nothing, Jon Snow." )
        end
        response.save!
    end
end
