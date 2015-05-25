class Api::UsersController < ApplicationController
  include Concerns::Resource

  before_filter :find_resources, only: %w(index)
  before_filter :new_resource, only: %w(create new)
  before_filter :find_resource, only: %w(show update destroy edit)

  def resource_scope
    User
  end

  def resource_symbol
    :user
  end

  def permitted_params
    %i(name time_zone)
  end

  def search_proxy
    resource_scope.limit(10).order('created_at DESC')
  end
end
