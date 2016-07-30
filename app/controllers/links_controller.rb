class LinksController < ApplicationController

  def index
    @links = Link.all
  end

  def new
    @link = Link.new
    render 'new.html.erb'
  end

  def create
    @link = Link.new(
      user_id: params['user_id'],
      slug: params['slug'].standardize_target_url!,
      target_url: params['target_url']
    )
    if @link.save
      flash[:success] = "Link successfully created"
      redirect_to '/links'
    else
      render 'new.html.erb'
    end
  end
end
