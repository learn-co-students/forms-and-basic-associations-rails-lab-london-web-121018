class Song < ActiveRecord::Base
  belongs_to :artist
  belongs_to :genre
  has_many :notes


  def artist_name=(name)
    self.artist = Artist.find_or_create_by(name: name)
  end
  
  def artist_name
    self.artist ? self.artist.name : nil
  end

  def genre_name=(name)
    self.genre = Genre.find_or_create_by(name: name)
  end
  
  def genre_name
    self.genre ? self.genre.name : nil
  end

  def note_contents=(contents)
      contents.each do |content|
        # byebug
        if content.length > 0
        note = Note.create(content: content)        
        self.notes << note
        end        
      end
  end

  def note_contents
    notes = []
    self.notes.each do |note|
      notes << note.content
    end
    notes
  end
end
