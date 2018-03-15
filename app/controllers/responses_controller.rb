class ResponsesController < ApplicationController
  before_action :current_user_must_be_response_applicant, :only => [:edit, :update, :destroy]

  def current_user_must_be_response_applicant
    response = Response.find(params[:id])

    unless current_user == response.applicant
      redirect_to :back, :alert => "You are not authorized for that."
    end
  end

  def index
    @q = current_user.responses.ransack(params[:q])
      @responses = @q.result(:distinct => true).includes(:question, :feedbacks, :sent_review_requests, :applicant).page(params[:page]).per(10)

    render("responses/index.html.erb")
  end

  def show
    @review_request = ReviewRequest.new
    @feedback = Feedback.new
    @response = Response.find(params[:id])

    render("responses/show.html.erb")
  end

  def new
    @response = Response.new

    render("responses/new.html.erb")
  end

  def create
    @response = Response.new

    @response.body = params[:body]
    @response.question_id = params[:question_id]
    @response.applicant_id = params[:applicant_id]

    save_status = @response.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/responses/new", "/create_response"
        redirect_to("/responses")
      else
        redirect_back(:fallback_location => "/", :notice => "Response created successfully.")
      end
    else
      render("responses/new.html.erb")
    end
  end

  def edit
    @response = Response.find(params[:id])

    render("responses/edit.html.erb")
  end

  def update
    @response = Response.find(params[:id])

    @response.body = params[:body]
    @response.question_id = params[:question_id]
    @response.applicant_id = params[:applicant_id]

    save_status = @response.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/responses/#{@response.id}/edit", "/update_response"
        redirect_to("/responses/#{@response.id}", :notice => "Response updated successfully.")
      else
        redirect_back(:fallback_location => "/", :notice => "Response updated successfully.")
      end
    else
      render("responses/edit.html.erb")
    end
  end

  def destroy
    @response = Response.find(params[:id])

    @response.destroy

    if URI(request.referer).path == "/responses/#{@response.id}"
      redirect_to("/", :notice => "Response deleted.")
    else
      redirect_back(:fallback_location => "/", :notice => "Response deleted.")
    end
  end
end
