class Decoding < ActiveRecord::Base

  before_validation :decode

  validates :encoded, presence: true

  def decode
    begin
      self.plain = PolybiusSquare::PolybiusSquareProcessor.process(encoded_string: self.encoded)
    rescue TypeError
      self.errors.add(:plain, "String could not be decoded")
    end
  end

end
