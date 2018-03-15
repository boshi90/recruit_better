class CompaniesController < ApplicationController
  def index
    @companies = Company.all

    render("companies/index.html.erb")
  end

  def show
    @target = Target.new
    @ask = Ask.new
    @company = Company.find(params[:id])

    render("companies/show.html.erb")
  end

  def new
    @company = Company.new

    render("companies/new.html.erb")
  end

  def create
    @company = Company.new

    @company.name = params[:name]
    @company.address = params[:address]
    @company.logo = params[:logo]

    save_status = @company.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/companies/new", "/create_company"
        redirect_to("/companies")
      else
        redirect_back(:fallback_location => "/", :notice => "Company created successfully.")
      end
    else
      render("companies/new.html.erb")
    end
  end

  def edit
    @company = Company.find(params[:id])

    render("companies/edit.html.erb")
  end

  def update
    @company = Company.find(params[:id])

    @company.name = params[:name]
    @company.address = params[:address]
    @company.logo = params[:logo]

    save_status = @company.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/companies/#{@company.id}/edit", "/update_company"
        redirect_to("/companies/#{@company.id}", :notice => "Company updated successfully.")
      else
        redirect_back(:fallback_location => "/", :notice => "Company updated successfully.")
      end
    else
      render("companies/edit.html.erb")
    end
  end

  def destroy
    @company = Company.find(params[:id])

    @company.destroy

    if URI(request.referer).path == "/companies/#{@company.id}"
      redirect_to("/", :notice => "Company deleted.")
    else
      redirect_back(:fallback_location => "/", :notice => "Company deleted.")
    end
  end
end
