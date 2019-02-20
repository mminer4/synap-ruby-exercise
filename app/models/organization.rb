class Organization < ApplicationRecord
    has_one :address
    has_many :people

    def build_organization_json(id)
        organization = Organization.find_by(id: id)
        address = Address.find_by(organization_id: organization.id)
        
        adress_object = build_address_object(address)

        organization_object = {
            id: organization.id,
            name: organization.name,
            domain: organization.domain,
            phone: organization.phone,
            people_count: organization.people_count,
            address: adress_object
        }
    end   

    def build_organizations_json
    organizations_object = []

    organizations = Organization.find_each do |organization|
        address = Address.find_by(organization_id: organization.id)
        
        adress_object = build_address_object(address)

        organization_object = {
            id: organization.id,
            name: organization.name,
            domain: organization.domain,
            phone: organization.phone,
            people_count: organization.people_count,
            address: adress_object
        }

        organizations_object << organization_object
    end

    organizations_object
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
end
