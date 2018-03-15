class FeedbacksController < ApplicationController
  def index
    @feedbacks = Feedback.all

    render("feedbacks/index.html.erb")
  end

  def show
    @feedback = Feedback.find(params[:id])

    render("feedbacks/show.html.erb")
  end

  def new
    @feedback = Feedback.new

    render("feedbacks/new.html.erb")
  end

  def create
    @feedback = Feedback.new

    @feedback.rating = params[:rating]
    @feedback.body = params[:body]
    @feedback.response_id = params[:response_id]
    @feedback.user_id = params[:user_id]

    save_status = @feedback.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/feedbacks/new", "/create_feedback"
        redirect_to("/feedbacks")
      else
        redirect_back(:fallback_location => "/", :notice => "Feedback created successfully.")
      end
    else
      render("feedbacks/new.html.erb")
    end
  end

  def edit
    @feedback = Feedback.find(params[:id])

    render("feedbacks/edit.html.erb")
  end

  def update
    @feedback = Feedback.find(params[:id])

    @feedback.rating = params[:rating]
    @feedback.body = params[:body]
    @feedback.response_id = params[:response_id]
    @feedback.user_id = params[:user_id]

    save_status = @feedback.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/feedbacks/#{@feedback.id}/edit", "/update_feedback"
        redirect_to("/feedbacks/#{@feedback.id}", :notice => "Feedback updated successfully.")
      else
        redirect_back(:fallback_location => "/", :notice => "Feedback updated successfully.")
      end
    else
      render("feedbacks/edit.html.erb")
    end
  end

  def destroy
    @feedback = Feedback.find(params[:id])

    @feedback.destroy

    if URI(request.referer).path == "/feedbacks/#{@feedback.id}"
      redirect_to("/", :notice => "Feedback deleted.")
    else
      redirect_back(:fallback_location => "/", :notice => "Feedback deleted.")
    end
  end
end
