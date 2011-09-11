
class VideosController < ApplicationController
  def new
    @video = Video.new
  end
  
  # framey callback
  def callback
    render :text => "" and return unless request.post? && params[:video]

    video = Video.create!({
      :name => params[:video][:name],
      :filesize => params[:video][:filesize],
      :duration => params[:video][:duration],
      :state => params[:video][:state],
      :views => params[:video][:views],
      :flv_url => params[:video][:flv_url],
      :mp4_url => params[:video][:mp4_url],
      :small_thumbnail_url => params[:video][:small_thumbnail_url],
      :medium_thumbnail_url => params[:video][:medium_thumbnail_url],          
      :large_thumbnail_url => params[:video][:large_thumbnail_url]
    })

    render :text => "" and return
  end
  
  def index
    @videos = Video.paginate(:page => params[:page], :per_page => 20)
  end
  
  def show
    @video = Video.find_by_name(params[:id])
  end

end
