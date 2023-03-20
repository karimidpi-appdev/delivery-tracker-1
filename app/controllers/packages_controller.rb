class PackagesController < ApplicationController
  def index
    matching_packages = Package.all

    @list_of_packages = matching_packages.order({ :created_at => :desc })

    render({ :template => "packages/index.html.erb" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_packages = Package.where({ :id => the_id })

    @the_package = matching_packages.at(0)

    render({ :template => "packages/show.html.erb" })
  end

  def create
    the_package = Package.new
    the_package.name = params.fetch("query_name")
    the_package.user_id = params.fetch("query_user_id")
    the_package.arrive_on = params.fetch("query_arrive_on")
    the_package.content = params.fetch("query_content")
    the_package.status = params.fetch("query_status")

    if the_package.valid?
      the_package.save
      redirect_to("/packages", { :notice => "Added to list" })
    else
      redirect_to("/packages", { :alert => the_package.errors.full_messages.to_sentence })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_package = Package.where({ :id => the_id }).at(0)

    the_package.name = params.fetch("query_name")
    the_package.user_id = params.fetch("query_user_id")
    the_package.arrive_on = params.fetch("query_arrive_on")
    the_package.content = params.fetch("query_content")
    the_package.status = params.fetch("query_status")

    if the_package.valid?
      the_package.save
      redirect_to("/packages/#{the_package.id}", { :notice => "Package updated successfully."} )
    else
      redirect_to("/packages/#{the_package.id}", { :alert => the_package.errors.full_messages.to_sentence })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_package = Package.where({ :id => the_id }).at(0)

    the_package.destroy

    redirect_to("/packages", { :notice => "Package deleted successfully."} )
  end
end
