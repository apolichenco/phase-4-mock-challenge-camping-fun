class CampersController < ApplicationController

    def index
        campers = Camper.all
        render json: campers
    end

    def show 
        camper = Camper.find_by(id: params[:id])
        if camper
            render json: camper, serializer: CamperShowActivitySerializer
            # render json: camper, include: :activities
        else 
            render json: {error: "Camper not found"}, status: :not_found
        end
    end

    def create
        camper = Camper.create!(params.permit(:name, :age))
        render json: camper, status: :created
        rescue ActiveRecord::RecordInvalid => invalid
            render json: { errors: invalid.record.errors.full_messages}, status: :unprocessable_entity
    end

    

end
