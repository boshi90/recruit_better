Rails.application.routes.draw do
  devise_for :users
  # Routes for the User resource:
  # READ
  get "/users", :controller => "users", :action => "index"
  get "/users/:id", :controller => "users", :action => "show"


  # Routes for the Feedback resource:
  # CREATE
  get "/feedbacks/new", :controller => "feedbacks", :action => "new"
  post "/create_feedback", :controller => "feedbacks", :action => "create"

  # READ
  get "/feedbacks", :controller => "feedbacks", :action => "index"
  get "/feedbacks/:id", :controller => "feedbacks", :action => "show"

  # UPDATE
  get "/feedbacks/:id/edit", :controller => "feedbacks", :action => "edit"
  post "/update_feedback/:id", :controller => "feedbacks", :action => "update"

  # DELETE
  get "/delete_feedback/:id", :controller => "feedbacks", :action => "destroy"
  #------------------------------

  # Routes for the Ask resource:
  # CREATE
  get "/asks/new", :controller => "asks", :action => "new"
  post "/create_ask", :controller => "asks", :action => "create"

  # READ
  get "/asks", :controller => "asks", :action => "index"
  get "/asks/:id", :controller => "asks", :action => "show"

  # UPDATE
  get "/asks/:id/edit", :controller => "asks", :action => "edit"
  post "/update_ask/:id", :controller => "asks", :action => "update"

  # DELETE
  get "/delete_ask/:id", :controller => "asks", :action => "destroy"
  #------------------------------

  # Routes for the Response resource:
  # CREATE
  get "/responses/new", :controller => "responses", :action => "new"
  post "/create_response", :controller => "responses", :action => "create"

  # READ
  get "/responses", :controller => "responses", :action => "index"
  get "/responses/:id", :controller => "responses", :action => "show"

  # UPDATE
  get "/responses/:id/edit", :controller => "responses", :action => "edit"
  post "/update_response/:id", :controller => "responses", :action => "update"

  # DELETE
  get "/delete_response/:id", :controller => "responses", :action => "destroy"
  #------------------------------

  # Routes for the Question resource:
  # CREATE
  get "/questions/new", :controller => "questions", :action => "new"
  post "/create_question", :controller => "questions", :action => "create"

  # READ
  get "/questions", :controller => "questions", :action => "index"
  get "/questions/:id", :controller => "questions", :action => "show"

  # UPDATE
  get "/questions/:id/edit", :controller => "questions", :action => "edit"
  post "/update_question/:id", :controller => "questions", :action => "update"

  # DELETE
  get "/delete_question/:id", :controller => "questions", :action => "destroy"
  #------------------------------

  # Routes for the Company resource:
  # CREATE
  get "/companies/new", :controller => "companies", :action => "new"
  post "/create_company", :controller => "companies", :action => "create"

  # READ
  get "/companies", :controller => "companies", :action => "index"
  get "/companies/:id", :controller => "companies", :action => "show"

  # UPDATE
  get "/companies/:id/edit", :controller => "companies", :action => "edit"
  post "/update_company/:id", :controller => "companies", :action => "update"

  # DELETE
  get "/delete_company/:id", :controller => "companies", :action => "destroy"
  #------------------------------

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
