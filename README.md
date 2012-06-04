# Youtube::Ripper

It helps you extract and download a Youtube video.
It requires the "curl" shell command.

## Installation

Add this line to your application's Gemfile:
```ruby
    gem 'youtube-ripper'
```
And then execute:
```bash
    $ bundle
```
Or install it yourself as:
```bash
  $ gem install youtube-ripper
```

## Usage

### Via shell

```bash
$ yt_ripper http://www.youtube.com/watch?v=sTSA_sWGM44
```

This will download the video in your current folder, using the video's title as the filename.

## TODO

* test
* add command line options
* add travis-ci support
* handle the quality switch
* multi download (via config file)
* download a whole youtube playlist

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
