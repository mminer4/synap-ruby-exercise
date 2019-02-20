class PeopleController < ApplicationController
    def index
        people = Person.all
        render json: {status: "Success", message: "Loaded people", data: people}, status: :ok
    end

    def show
        person = Person.find(params[:id])
        render json: {status: "Success", message: "Loaded person", data: person}, status: :ok
    end
end