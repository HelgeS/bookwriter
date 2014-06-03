class Book < ActiveRecord::Base
  attr_accessible :abstract, :edition, :genre, :published, :tags, :title, :user_ids
  attr_accessor :usernames
  before_destroy :destroy_chunks

  has_and_belongs_to_many :users
  has_many :chunks, :order => 'position'

  def get_content
    content = ''

    chunks.order('position ASC').each do |c|
      content += c.content
    end

    content
  end

  def usernames
    users.map { |u| u.full_name }.join(', ')
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
