class Decoding < ActiveRecord::Base

  before_validation :decode

  validates :encrypted, presence: true

  def decode
    begin
      self.plain = PolybiusSquare::PolybiusSquareProcessor.process(encoded_string: self.encrypted)
    rescue TypeError
      self.errors.add(:plain, "String could not be decoded")
    end
  end

end
