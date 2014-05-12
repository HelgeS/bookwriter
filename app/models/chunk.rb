class Chunk < ActiveRecord::Base
  attr_accessible :content, :section, :title, :user_id, :original_updated_at
  attr_writer :original_updated_at
  belongs_to :user
  belongs_to :book
  validate :handle_conflict, only: :update

  # Versionierung durch Paper trail
  has_paper_trail

  def username
    user.email
  end

  def original_updated_at
    @original_updated_at || updated_at.to_f
  end

  def handle_conflict
    if @conflict || updated_at.to_f > original_updated_at.to_f
      @conflict = true
      @original_updated_at = nil
      errors.add :base, 'Content was modified by another user. Please merge the changes!'

      changes.each do |attribute, values|
        unless attribute == 'content'
          errors.add attribute, "was changed to #{values.first}."
        else
          errors.add attribute, 'was changed.'
          self.content = '== CONTENT OF OTHER USER =='
          self.content << values.first
          self.content << '== YOUR CONTENT =='
          self.content << values.last
        end
      end
    end
  end
end
