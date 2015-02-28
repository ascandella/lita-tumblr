require 'json'
require 'net/http'

module Lita
  module Handlers
    class Tumblr < Handler
      config :api_key, types: [String]

      route /^tumbl(e|r) (.*)/, :tumble,  command: true

      def tumble(response)
        blog = response.matches.first.first
        if !(/\.com$/ =~ blog)
          blog = "#{blog}.tumblr.com"
        end

        api_url = "/v2/blog/#{blog}/posts"
        api_url += "?type=photo&api_key=#{config.api_key}"

        api_response = Net::HTTP.get_response('api.tumblr.com', api_url)
        json_stuff = JSON.parse(api_response.body)

        posts = json_stuff['response']['posts']
        post = posts[Random.rand(posts.length)]

        photo = post['photos'][0]['alt_sizes'][0]['url']

        response.reply photo
      end
    end

    Lita.register_handler(Tumblr)
  end
end
