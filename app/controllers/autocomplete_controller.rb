class AutocompleteController < ApplicationController
  before_filter :authenticate_user!

  def users
    if params[:term]
      like = "%".concat(params[:term].concat("%"))
      users = User.where("first_name like ? OR last_name like ? OR email like ?", like, like, like)
    else
      users = User.all
    end

    #list = users.map {|u| Hash[id: u.id, label: u.full_name, name: u.full_name]}
    list = users.map {|u| u.email}

    render json: list
  end
end
