class OrganizationsController < ApplicationController
    def index
        organization = Organization.new
        organizations_object = organization.build_organizations_json
        render json: {status: "Success", message: "Loaded organizations", organizations: organizations_object}, status: :ok
    end
    
    def show
        organization_id = params[:id]
        organization = Organization.new
        organization_object = organization.build_organization_json(organization_id)
        render json: {status: "Success", message: "Loaded organization", organization: organization_object}, status: :ok
    end
end