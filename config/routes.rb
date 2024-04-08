Rails.application.routes.draw do
  get("/", { :controller => "home", :action => "homepage" })

  get("/users", { :controller => "home", :action => "homepage" })
  post("/add_user", { :controller => "users", :action => "create" })
  get("/users/:path_id", { :controller => "users", :action => "show" })
  post("/update_user/:path_id", { :controller => "users", :action => "update" })

  get("/photos", { :controller => "photos", :action => "home" })
  post("/insert_photo_record", { :controller => "photos", :action => "create" })
  get("/photos/:path_id", { :controller => "photos", :action => "show" })
  post("/update_photo/:path_id", { :controller => "photos", :action => "update" })
  get("/delete_photo/:path_id", { :controller => "photos", :action => "destroy" })

  post("/add_comment", { :controller => "comments", :action => "create" })
end
