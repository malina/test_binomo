module Concerns::Resource
  extend ActiveSupport::Concern

  included do
  end

  # Configureation
  def resource_scope
    #Some::Class
  end

  def permitted_params
  end

  def added_params
    {}
  end

  def search_by
    []
  end

  def extend_resources_attributes(resource)
    {}
  end

  def resource_attribute_kind
    :id
  end

  def resource_attribute_params
    params[:id]
  end

  # Methods
  def new_resource
    @resource ||= resource_scope.new resource_params
  end

  def resource_symbol
    resource_scope.name.underscore.to_sym
  end

  def find_resource
    @resource ||= resource_scope.find_by(resource_attribute_kind => resource_attribute_params)
  end

  def find_resources
    @resources ||= search_proxy
    search_with_query unless params[:query].blank?
  end

  def search_proxy
    resource_scope.all
  end

  def search_with_query
    params_array = []

    @query = params[:query]
    like_text = @query.to_i > 0 ? @query.to_i : Regexp.new(Regexp.escape(@query), 'i')

    search_by.each do |item|
      params_array << {item => like_text}
    end

    @resources = @resources.any_of(params_array)
  end

  def resource_params
    if params[resource_symbol] && permitted_params
      params.require(resource_symbol).permit(permitted_params).merge(added_params)
    elsif params[resource_symbol] && permitted_params.nil?
      params.require(resource_symbol).permit!.merge(added_params)
    else
      added_params
    end
  end

  def extend_resources!
    @resources = @resources.to_a
    ((@resources || []) + [(@resource if @resource)]).compact.each do |resource|
      extend_resources_attributes(resource).each do |key, value|
        resource.class_eval { attr_accessor key }
        resource.send(key.to_s + '=', value)
        resource.add_json_method key
      end
    end
  end

  # Actions
  def send_json(obj, success)
    render json: obj.as_json, status: success ? 200 : 403
  end

  def index
    send_json @resources.to_a, true
  end

  def create
    send_json @resource, @resource.save
  end

  def update
    send_json @resource, @resource.update_attributes(resource_params)
  end

  def new
    send_json @resource, true
  end

  def show
    send_json @resource, true
  end

  def destroy
    send_json @resource, @resource.destroy
  end
end
