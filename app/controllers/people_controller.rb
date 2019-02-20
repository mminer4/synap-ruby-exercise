class PeopleController < ApplicationController
    def index
        person = Person.new
        people_object = person.build_people_json
        render json: {status: "Success", message: "Loaded people", people: people_object}, status: :ok
    end
    
    def show
        person_id = params[:id]
        person = Person.new
        person_object = person.build_person_json(person_id)
        render json: {status: "Success", message: "Loaded people", person: person_object}, status: :ok
    end
end