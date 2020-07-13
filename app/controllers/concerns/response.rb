# frozen_string_literal: true

require 'flash_briefing'

module Response
  include FlashBriefing

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

  def alexa_sales_briefing_response(projects:)
    return unless projects

    debugger

    render json: {
      mainText: main_text(projects),
    }, status: :ok
  end
end
