class Book < ActiveRecord::Base
  attr_accessible :abstract, :edition, :genre, :published, :tags, :title, :user_ids
  before_destroy :destroy_chunks

  has_and_belongs_to_many :users
  has_many :chunks, :order => 'position'

  def get_content
    content = ''

    chunks.order('position ASC').each do |c|
      content += "<h2>#{c.title}</h2>"
      content += c.content
    end

    content
  end

  def has_chunks?
    !chunks.empty?
  end

  def destroy_chunks
    chunks.each do |chunk|
      chunk.destroy
    end
  end
end
