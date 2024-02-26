class ApplicationController < ActionController::API
  rescue_from ActiveRecord::RecordNotFound, with: :not_found_response 
  rescue_from ActiveRecord::RecordInvalid, with: :invalid_record_response 
  rescue_from ActionController::BadRequest, with: :bad_request_response

private
  # when AR query like find is used and no record of an ID exists 
  def not_found_response(exception) 
    render json: ErrorSerializer.new(ErrorMessage.new(exception.message, 404))
      .serialize_json, status: :not_found
  end

  # when AR model fail upon saving (save, create, update)
  def invalid_record_response(exception)
    render json: ErrorSerializer.new(ErrorMessage.new(exception.message, 422))
      .serialize_json, status: :unprocessable_entity
  end

  # when a request can't be processed due to bad parameters
  def bad_request_response(exception)
    render json: ErrorSerializer.new(ErrorMessage.new(exception.message, 400))
      .serialize_json, status: :bad_request
  end
end
