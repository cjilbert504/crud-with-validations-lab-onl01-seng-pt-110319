class SongsController < ApplicationController
    before_action :find_song, only: [:show, :edit, :update, :destroy]

    def index
        @songs = Song.all
    end

    def show
    end

    def new
        @song = Song.new
    end

    def edit
    end

    def create
        @song = Song.new(post_params)
        if @song.valid?
            @song.save
            redirect_to song_path(@song)
        else
            render :new
        end
    end

    def update
        if @song.update(post_params)
            redirect_to song_path(@song)
        else
            render :edit
        end
    end

    def destroy
        @song.destroy
        redirect_to songs_url
    end

    private

    def find_song
        @song = Song.find(params[:id])
    end

    def post_params
        params.require(:song).permit(:title, :released, :release_year, :artist_name, :genre)
    end
end