class TwitterSearch
  def get_tweets
    tweet_array = Array.new
    Twitter::Search.new('Accidente' || 'accidente').from('sttmed').each do |r|
      tweet = {}
      
      tweet["twitter_id"] = r.id_str
      tweet["texto"] = r.text
      tweet["reportado"] = (Time.parse(r.created_at)).localtime.strftime("%B %d, %H:%M %p %Z")
      tweet["direccion"] = r.text.scan(/\w*_\w*/).join
      tweet_array << tweet
    end
    return tweet_array
    
  end

  def save_tweets(tweet_array)
     tweet_array.each do |r|
        @reporte_accidente = ReporteAccidente.create(:twitter_id => r["twitter_id"], :texto => r["texto"], :fechahora => r["reportado"])
      end
  end
end
