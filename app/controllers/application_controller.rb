# frozen_string_literal: true

class ApplicationController < ActionController::API
  rescue_from ActiveRecord::RecordNotFound, with: :not_found
  rescue_from ActionController::ParameterMissing, with: :parameter_missing
  rescue_from ArgumentError, with: :argument_error
  rescue_from ActiveRecord::SubclassNotFound, with: :sub_class_not_found
  rescue_from AbstractController::ActionNotFound, with: :action_not_found
  rescue_from ActionController::RoutingError, with: :routing_error
  rescue_from ActiveRecord::RecordNotUnique, with: :record_not_unique
  # rescue_from Pundit::NotAuthorizedError, with: :pundit_not_authorized

  private
    def not_found(exception)
      render status: 404, json: { errors: { message: "Couldn't find #{exception.model} with id #{exception.id}" }, meta: { message: "not_found" } }
    end

    def parameter_missing(exception)
      render json: { error: { message: "Some data are missing." } }, adapter: :json, status: 422
    end

    def argument_error(exception)
      render json: { error: { message: "Invalid data." } }, adapter: :json, status: 422
    end

    def sub_class_not_found(exception)
      render json: { error: { message: "Not a valid class." } }, adapter: :json, status: 422
    end

    def action_not_found(exception)
      render json: { error: { message: "Invalid request." } }, adapter: :json, status: 404
    end

    def routing_error(exception)
      render json: { error: { message: "Invalid request." } }, adapter: :json, status: 404
    end

    def record_not_unique(exception)
      render json: { error: { message: "Not allowed to create duplicate record." } }, adapter: :json, status: 404
    end

  # def pundit_not_authorized(exception)
  #   render status: 404, json: { errors: { message: "You are not allowed to do this action." }, meta: { message: "You are not allowed to do this action." } }
  #   render json: { error: { message: "Invalid data." } }, adapter: :json, status: 422
  # end
end
