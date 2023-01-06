class SignupsController < ApplicationController

    def create
        signup = Signup.create!(params.permit(:time, :camper_id, :activity_id))

        render json: signup.activity, status: :created
        rescue ActiveRecord::RecordInvalid => invalid
            render json: { errors: invalid.record.errors.full_messages}, status: :unprocessable_entity
    end

end
