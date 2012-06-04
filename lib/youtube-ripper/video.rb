module Youtube
  class Video
    def initialize(page_url)
      @page_url = page_url
    end

    def title_underscored
      title.strip.downcase.gsub(/[^a-z0-9]+/, '_')
    end

    def title
      @title ||= flashvars['title'].first
    end

    def download_url
      @download_url ||= begin
        stream_hash = flashvars['url_encoded_fmt_stream_map'].first
        CGI::parse(stream_hash)['url'].first
      end
    end

    private

    def flashvars
      @flashvars ||= begin
        embed = Nokogiri::HTML(js_fragment).css('embed')
        #title = embed.to_json['title']
        CGI::parse(embed.attr('flashvars').value)
      end
    end

    def js_fragment
      Nokogiri::HTML(open(@page_url)).
      css('#watch-video').
      children.select {|x| x.name == 'script'}.
      last.
      children.
      first.
      content.
      gsub("\n      (function() {\n        var swf = \"", '').
      gsub("\";\n        document.getElementById('watch-player').innerHTML = swf;\n      })()\n    ", '').
      gsub(/\\u[a-z0-9]{4}/) {|x| [x.chars.to_a[2..-1].join.to_i(16)].pack("U*")}.
      gsub('\\n', '\\').gsub('\\', '')
    end
  end
end
