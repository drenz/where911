
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
    wtc = [40.711626, -74.010714]
    @videos = Video.all

    @map = Cartographer::Gmap.new('map',
                                    :type => 'terrain',
                                    :center => wtc,
                                    :zoom => 14,
                                    :controls => [:zoom]
                                 )
    markers = []
    @icon = Cartographer::Gicon.new()
    @map.icons <<  @icon
    
    @videos.each do |video|
      marker = Cartographer::Gmarker.new(:name=> "taj_mahal", :marker_type => "Building",
                 :position => [video.latitude,video.longitude],
                 :info_window_url => "/videos/#{video.id}", :icon => @icon)
      @map.markers << marker
    end
    
    marker = Cartographer::Gmarker.new(:name=> "taj_mahal", :marker_type => "Building",
                :position => wtc,
                :info_window_url => "/videos/#{}", :icon => @icon)
     @map.markers << marker
    
  end
  
  def show
    @video = Video.find_by_name(params[:id])
  end

end
