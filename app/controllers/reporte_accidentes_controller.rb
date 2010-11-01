require 'twittersearch'
class ReporteAccidentesController < ApplicationController
  before_filter :twitter_wrapper
  # GET /reporte_accidentes
  # GET /reporte_accidentes.xml
  def index
    @reporte_accidentes = ReporteAccidente.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @reporte_accidentes }
    end
  end

  # GET /reporte_accidentes/1
  # GET /reporte_accidentes/1.xml
  def show
    @reporte_accidente = ReporteAccidente.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @reporte_accidente }
    end
  end

  # GET /reporte_accidentes/new
  # GET /reporte_accidentes/new.xml
  def new
    @reporte_accidente = ReporteAccidente.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @reporte_accidente }
    end
  end

  # GET /reporte_accidentes/1/edit
  def edit
    @reporte_accidente = ReporteAccidente.find(params[:id])
  end

  # POST /reporte_accidentes
  # POST /reporte_accidentes.xml
  def create
    @reporte_accidente = ReporteAccidente.new(params[:reporte_accidente])

    respond_to do |format|
      if @reporte_accidente.save
        format.html { redirect_to(@reporte_accidente, :notice => 'Reporte accidente was successfully created.') }
        format.xml  { render :xml => @reporte_accidente, :status => :created, :location => @reporte_accidente }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @reporte_accidente.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /reporte_accidentes/1
  # PUT /reporte_accidentes/1.xml
  def update
    @reporte_accidente = ReporteAccidente.find(params[:id])

    respond_to do |format|
      if @reporte_accidente.update_attributes(params[:reporte_accidente])
        format.html { redirect_to(@reporte_accidente, :notice => 'Reporte accidente was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @reporte_accidente.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /reporte_accidentes/1
  # DELETE /reporte_accidentes/1.xml
  def destroy
    @reporte_accidente = ReporteAccidente.find(params[:id])
    @reporte_accidente.destroy

    respond_to do |format|
      format.html { redirect_to(reporte_accidentes_url) }
      format.xml  { head :ok }
    end
  end

# POST /reporte_accidentes/fetch
  def fetch
    @reporte_tweets = @wrapper.get_tweets
    @saved_tweets = @wrapper.save_tweets(@reporte_tweets)
    respond_to do |format|
     format.html { redirect_to(reporte_accidentes_url) }
      format.xml  { render :xml => @reportes_gc }
     end
  end
  
private
  def twitter_wrapper
    @wrapper = TwitterSearch.new
  end
end