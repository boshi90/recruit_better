class TargetsController < ApplicationController
  before_action :current_user_must_be_target_user, :only => [:edit, :update, :destroy]

  def current_user_must_be_target_user
    target = Target.find(params[:id])

    unless current_user == target.user
      redirect_to :back, :alert => "You are not authorized for that."
    end
  end

  def index
    @targets = Target.all

    render("targets/index.html.erb")
  end

  def show
    @target = Target.find(params[:id])

    render("targets/show.html.erb")
  end

  def new
    @target = Target.new

    render("targets/new.html.erb")
  end

  def create
    @target = Target.new

    @target.user_id = params[:user_id]
    @target.company_id = params[:company_id]

    save_status = @target.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/targets/new", "/create_target"
        redirect_to("/targets")
      else
        redirect_back(:fallback_location => "/", :notice => "Target created successfully.")
      end
    else
      render("targets/new.html.erb")
    end
  end

  def edit
    @target = Target.find(params[:id])

    render("targets/edit.html.erb")
  end

  def update
    @target = Target.find(params[:id])
    @target.company_id = params[:company_id]

    save_status = @target.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/targets/#{@target.id}/edit", "/update_target"
        redirect_to("/targets/#{@target.id}", :notice => "Target updated successfully.")
      else
        redirect_back(:fallback_location => "/", :notice => "Target updated successfully.")
      end
    else
      render("targets/edit.html.erb")
    end
  end

  def destroy
    @target = Target.find(params[:id])

    @target.destroy

    if URI(request.referer).path == "/targets/#{@target.id}"
      redirect_to("/", :notice => "Target deleted.")
    else
      redirect_back(:fallback_location => "/", :notice => "Target deleted.")
    end
  end
end
