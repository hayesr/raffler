class EntriesController < ApplicationController

  def index
    # respond_with Entry.all
    @entries = Entry.all
    render json: @entries
  end

  def show
    @entry = Entry.find(params[:id])
    render json: @entry
  end

  def create
    @entry = Entry.create(entry_params)
    render json: @entry
  end

  def update
    @entry = Entry.update(params[:id], entry_params)
    render json: @entry
  end

  def destroy
    Entry.destroy(params[:id])
    render json: "Entry destroyed"
  end

  private

  def entry_params
    params.require(:entry).permit!
  end
end
