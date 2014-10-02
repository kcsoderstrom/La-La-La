module ApplicationHelper

  def ugly_lyrics(lyrics)
    lyrics_lines = lyrics.split("\n")
    "<pre>#{ lyrics_lines.map{ |line| "♫ #{h(line)}\n" }.join }</pre>".html_safe
  end

end
