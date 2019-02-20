module Api
    class OrganizationsController < ApplicationController
        def index
            organizations = Organization.all
            render json: {status: "Success", message: "Loaded people", data: organizations}, status: :ok
        end

        def show
            organization = Organization.find(params[:id])
            render json: {status: "Success", message: "Loaded people", data: organization}, status: :ok
        end
    end
end