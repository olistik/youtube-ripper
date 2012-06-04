module Youtube
  class Ripper
    attr_reader :video

    def initialize(page_url)
      @page_url = page_url
    end

    def fetch
      @video = OpenStruct.new title: title, url: download_url
      self
    end

    private
    def html
      Nokogiri::HTML(open(@page_url))
    end

    def flashvars
      @flashvars ||= fetch_flashvars
    end

    def title
      @title ||= fetch_title
    end

    def download_url
      @download_url ||= fetch_download_url
    end

    def fetch_flashvars
      js_fragment = html.
        css('#watch-video').
        children.select {|x| x.name == 'script'}.
        last.
        children.
        first.
        content.
        gsub!("\n      (function() {\n        var swf = \"", '').
        gsub!("\";\n        document.getElementById('watch-player').innerHTML = swf;\n      })()\n    ", '').
        gsub!(/\\u[a-z0-9]{4}/) {|x| [x.chars.to_a[2..-1].join.to_i(16)].pack("U*")}.
        gsub!('\\n', '\\').gsub!('\\', '')
      embed = Nokogiri::HTML(js_fragment).css('embed')
      #title = embed.to_json['title']
      CGI::parse(embed.attr('flashvars').value)
    end

    def fetch_download_url
      stream_map = flashvars['url_encoded_fmt_stream_map'].first
      CGI::parse(stream_map)['url'].first
    end

    def fetch_title
      flashvars['title'].first
    end

  end
end
