def seed_org_person_address(parsed_csv)
    create_orgs(parsed_csv)
    create_people(parsed_csv)
    create_addresses(parsed_csv)
    count_org_people
end

def create_orgs(parsed_csv)
    parsed_csv.each do |row|
        if Organization.exists?(name: row[4])
            next
        else
            Organization.create({
                name: row[4],
                phone: row[5],
                domain: row[6]
            })
        end
    end
end

def create_people(parsed_csv)
    parsed_csv.each do |row|
        org = Organization.find_by(name: row[4])
    
        if Person.exists?(name: row[0])
            next
        else
            Person.create({
                name: row[0],
                job_title: row[1],
                email_address: row[2],
                phone: row[3],
                organization: org
            })
        end
    end
end

def create_addresses(parsed_csv)
    parsed_csv.each do |row|
        org = Organization.find_by(name: row[4])
    
        if row[7].blank? || Address.exists?(street: row[7])
            next
        else
            Address.create({
                street: row[7],
                city: row[8],
                state: row[9],
                zip: row[10],
                organization: org
            })
        end
    end
end

def count_org_people
    Organization.all.each do |org|
        person_count = Person.where(organization_id: org.id).count
        org.update_attribute(:people_count, person_count)
    end
end