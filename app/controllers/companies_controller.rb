class CompaniesController < ApplicationController

  def index
    @companies = Company.all
  end

  def show
    # find a Company
    @company = Company.find_by({"id" => params["id"]})
    
    # SELECT * FROM contacts WHERE company_id=1
    @contacts = Contact.where({"company_id" => params["id"]})

    # render companies/show view with details about Company
  end

  def new
    @company = Company.find_by({"id" => params["company_id"]})
    # render view with new Company form
  end

  def create
  #   # start with a new Company
      @company = Company.new
  #   # assign user-entered form data to Company's columns
      @company["name"] = params["name"]
      @company["city"] = params["city"]
      @company["state"] = params["state"]
  #   # save Company row
      @company.save
  #   # redirect user
      redirect_to "/companies"
  end

  # def edit
  #   # find a Company
  #   # render view with edit Company form
  # end

  # def update
  #   # find a Company
  #   # assign user-entered form data to Company's columns
  #   # save Company row
  #   # redirect user
  # end

  # def destroy
  #   # find a Company
  #   # destroy Company row
  #   # redirect user
  # end

end
