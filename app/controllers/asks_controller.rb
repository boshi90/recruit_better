class AsksController < ApplicationController
  def index
    @asks = Ask.page(params[:page]).per(10)

    render("asks/index.html.erb")
  end

  def show
    @ask = Ask.find(params[:id])

    render("asks/show.html.erb")
  end

  def new
    @ask = Ask.new

    render("asks/new.html.erb")
  end

  def create
    @ask = Ask.new

    @ask.company_id = params[:company_id]
    @ask.question_id = params[:question_id]

    save_status = @ask.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/asks/new", "/create_ask"
        redirect_to("/asks")
      else
        redirect_back(:fallback_location => "/", :notice => "Ask created successfully.")
      end
    else
      render("asks/new.html.erb")
    end
  end

  def edit
    @ask = Ask.find(params[:id])

    render("asks/edit.html.erb")
  end

  def update
    @ask = Ask.find(params[:id])

    @ask.company_id = params[:company_id]
    @ask.question_id = params[:question_id]

    save_status = @ask.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/asks/#{@ask.id}/edit", "/update_ask"
        redirect_to("/asks/#{@ask.id}", :notice => "Ask updated successfully.")
      else
        redirect_back(:fallback_location => "/", :notice => "Ask updated successfully.")
      end
    else
      render("asks/edit.html.erb")
    end
  end

  def destroy
    @ask = Ask.find(params[:id])

    @ask.destroy

    if URI(request.referer).path == "/asks/#{@ask.id}"
      redirect_to("/", :notice => "Ask deleted.")
    else
      redirect_back(:fallback_location => "/", :notice => "Ask deleted.")
    end
  end
end
