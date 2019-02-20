class Person < ApplicationRecord
    belongs_to :organization

    def build_person_json(id)

    person = Person.find_by(id: id)
    organization = Organization.find_by(id: person.organization_id)
    address = Address.find_by(organization_id: person.organization_id)
    
    adress_object = build_address_object(address)
    organization_object = build_organization_object(organization)

    person_object = {
        id: person.id,
        name: person.name,
        job_title: person.job_title,
        email_address: person.email_address,
        phone: person.phone,
        organization: organization_object,
        address: adress_object
    }
    end   

    def build_people_json
    people_object = []

    people = Person.find_each do |person|
        organization = Organization.find_by(id: person.organization_id)
        address = Address.find_by(organization_id: person.organization_id)
        
        adress_object = build_address_object(address)
        organization_object = build_organization_object(organization)

        person_object = {
        id: person.id,
        name: person.name,
        job_title: person.job_title,
        email_address: person.email_address,
        phone: person.phone,
        organization: organization_object,
        address: adress_object
        }

        people_object << person_object
    end

    people_object
    end

    private

    def build_address_object(address)
    if address.blank?
        address_object = nil
    else
        address_object = {
        id: address.id,
        street: address.street,
        city: address.city,
        state: address.state,
        zip: address.zip
        }
    end
    end

    def build_organization_object(organization)
        if organization.blank?
            organization_object = nil
        else
            organization_object = {
                id: organization.id,
                name: organization.name,
                domain: organization.domain,
                phone: organization.phone
            }
        end
    end
end
