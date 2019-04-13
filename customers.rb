class Customer

  attr_reader :name, :wallet, :favorite_song

  def initialize(name, wallet = 0, favorite_song = 'Song 2')
    @name = name
    @wallet = wallet
    @favorite_song = favorite_song
  end

  def remove_money(room)
     @wallet > 0 ? @wallet -= room.fee : false
  end

  def cant_afford_room(room)
    @wallet < room.fee
  end

  def cheer_for_song(room)
     for song in room.songs
       if song.title == @favorite_song
         return "Wooo Hoooo"
       end
     end
   return "I can't believe they don't have that song!"
  end

end
