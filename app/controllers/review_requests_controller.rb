class ReviewRequestsController < ApplicationController
  before_action :current_user_must_be_review_request_applicant, :only => [:edit, :update, :destroy]

  def current_user_must_be_review_request_applicant
    review_request = ReviewRequest.find(params[:id])

    unless current_user == review_request.applicant
      redirect_to :back, :alert => "You are not authorized for that."
    end
  end

  def index
    @review_requests = ReviewRequest.all

    render("review_requests/index.html.erb")
  end

  def show
    @review_request = ReviewRequest.find(params[:id])

    render("review_requests/show.html.erb")
  end

  def new
    @review_request = ReviewRequest.new

    render("review_requests/new.html.erb")
  end

  def create
    @review_request = ReviewRequest.new

    @review_request.applicant_id = params[:applicant_id]
    @review_request.reviewer_id = params[:reviewer_id]
    @review_request.response_id = params[:response_id]

    save_status = @review_request.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/review_requests/new", "/create_review_request"
        redirect_to("/review_requests")
      else
        redirect_back(:fallback_location => "/", :notice => "Review request created successfully.")
      end
    else
      render("review_requests/new.html.erb")
    end
  end

  def edit
    @review_request = ReviewRequest.find(params[:id])

    render("review_requests/edit.html.erb")
  end

  def update
    @review_request = ReviewRequest.find(params[:id])

    @review_request.applicant_id = params[:applicant_id]
    @review_request.reviewer_id = params[:reviewer_id]
    @review_request.response_id = params[:response_id]

    save_status = @review_request.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/review_requests/#{@review_request.id}/edit", "/update_review_request"
        redirect_to("/review_requests/#{@review_request.id}", :notice => "Review request updated successfully.")
      else
        redirect_back(:fallback_location => "/", :notice => "Review request updated successfully.")
      end
    else
      render("review_requests/edit.html.erb")
    end
  end

  def destroy
    @review_request = ReviewRequest.find(params[:id])

    @review_request.destroy

    if URI(request.referer).path == "/review_requests/#{@review_request.id}"
      redirect_to("/", :notice => "Review request deleted.")
    else
      redirect_back(:fallback_location => "/", :notice => "Review request deleted.")
    end
  end
end
