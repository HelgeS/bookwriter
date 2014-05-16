class AddPositionToChunk < ActiveRecord::Migration
  def change
    add_column :chunks, :position, :integer

    Book.all.each do |b|
      i = 1
      b.chunks.each do |c|
        c.position = i
        c.save
        i += 1
      end
    end
  end
end
