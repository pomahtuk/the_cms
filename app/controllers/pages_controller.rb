class PagesController < ApplicationController
  include TheSortableTreeController::Rebuild

  before_filter :find_page, :only => [:show, :edit, :update, :destroy]

  def index
    @pages = Page.all
  end

  def show; end

  def edit; end

  def new
    @page = Page.new
  end

  def manage
    @pages = User.first.pages.nested_set.all
  end

  def create
    @page = Page.new params[:page]

    if @page.save
      redirect_to @page, notice: 'Page was successfully created.'
    else
      render action: "new"
    end
  end

  def update
    if @page.update_attributes params[:page]
      redirect_to edit_page_path(@page), notice: 'Page was successfully updated.'
    else
      render action: "edit"
    end
  end

  def destroy
    @page.destroy
    redirect_to pages_url
  end

  private

  def find_page
    @page = Page.find params[:id]
  end
end