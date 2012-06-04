module Youtube
  class Downloader
    def initialize(video)
      @video = video
    end

    def perform!
      `curl "#{@video.url}" -L -o #{filename}`
    end

    def filename
      @filename ||= @video.title.strip.downcase.gsub(/[^a-z0-9]+/, '_') + ".mp4"
    end
  end
end
