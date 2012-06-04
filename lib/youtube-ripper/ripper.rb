module Youtube
  class Ripper
    def initialize(page_url)
      @video = Video.new(page_url)
    end

    def perform
      `curl '#{@video.download_url}' -L -o #{filename}`
    end

    def filename
      @video.title_underscored + '.mp4'
    end

    def video_title
      @video.title
    end
  end
end
