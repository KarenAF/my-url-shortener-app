class VisitsController < ApplicationController
  def create
    visit = Visit.new(
    link_id: params['link_id'],
    ip_address: params['ip_address']
    )
  end
end
