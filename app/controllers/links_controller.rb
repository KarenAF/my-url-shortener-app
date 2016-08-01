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

  def edit
    @link = Link.find_by(id: params['id'])
    render 'edit.html.erb'
  end

  def update
    @link = Link.find_by(id: params['id'])
    @link.update(
      user_id: params['user_id'],
      slug: params['slug'].standardize_target_url!,
      target_url: params['target_url']
    )
    if @link.save
      flash[:success] = "Link successfully updated"
      redirect_to '/links/#{@link.id}'
    else
      render 'edit.html.erb'
    end
  end
end
