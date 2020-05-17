# frozen_string_literal: true

module Response
  def success_response(data:, model:, includes: '', status: :ok)
    return unless data || model

    if data.respond_to?('each')
      render json: data,
             each_serializer: "Api::V1::#{model}Serializer".constantize,
             includes: includes.split(','), status: status
    else
      render json: data, serializer: "Api::V1::#{model}Serializer".constantize,
             includes: includes.split(','), status: status
    end
  end

  def error_response
    render json: {}, status: :unprocessable_entity
  end
end
