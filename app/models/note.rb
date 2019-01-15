class Note < ActiveRecord::Base
  # add associations here
  belongs_to :song

  def self.createnotes(array)
    creatednotes = []
    array.each do |a|
      creatednotes << Note.create(content:a)
    end
    creatednotes
  end
end
