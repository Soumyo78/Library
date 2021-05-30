class Api::V1::AuthorsController < ApplicationController
  before_action :set_author, only: [:update, :show, :destory]

  def index
    authors = Author.all.page(params[:page])
    render json: authors, meta: { message: "All authors fetched successfully ..." }, adapter: :json
  end

  def show
    render json: @author, adapter: :json
  end


  def destroy
    @author.destroy
    head 204
  end

  private
    def set_author
      @author = Author.find(params[:id])
    end

    def author_params
      params.require(:author).permit(:first_name, :last_name)
    end
end
