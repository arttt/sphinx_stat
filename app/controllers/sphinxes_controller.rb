class SphinxesController < ApplicationController
  # GET /sphinxes
  # GET /sphinxes.json
  def index
    @sphinxes = Sphinx.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @sphinxes }
    end
  end

  # GET /sphinxes/1
  # GET /sphinxes/1.json
  def show
    @sphinx = Sphinx.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @sphinx }
    end
  end

  # GET /sphinxes/new
  # GET /sphinxes/new.json
  def new
    @sphinx = Sphinx.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @sphinx }
    end
  end

  # GET /sphinxes/1/edit
  def edit
    @sphinx = Sphinx.find(params[:id])
  end

  # POST /sphinxes
  # POST /sphinxes.json
  def create
    @sphinx = Sphinx.new(params[:sphinx])

    respond_to do |format|
      if @sphinx.save
        format.html { redirect_to @sphinx, notice: 'Sphinx was successfully created.' }
        format.json { render json: @sphinx, status: :created, location: @sphinx }
      else
        format.html { render action: "new" }
        format.json { render json: @sphinx.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /sphinxes/1
  # PUT /sphinxes/1.json
  def update
    @sphinx = Sphinx.find(params[:id])

    respond_to do |format|
      if @sphinx.update_attributes(params[:sphinx])
        format.html { redirect_to @sphinx, notice: 'Sphinx was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @sphinx.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sphinxes/1
  # DELETE /sphinxes/1.json
  def destroy
    @sphinx = Sphinx.find(params[:id])
    @sphinx.destroy

    respond_to do |format|
      format.html { redirect_to sphinxes_url }
      format.json { head :no_content }
    end
  end
end
