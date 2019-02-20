module Api
    class OrganizationsController < ApplicationController
        def index
            organizations = Organization.all
            render json: {status: "Success", message: "Loaded organizations", data: organizations}, status: :ok
        end

        def show
            organization = Organization.find(params[:id])
            render json: {status: "Success", message: "Loaded organization", data: organization}, status: :ok
        end
    end
end