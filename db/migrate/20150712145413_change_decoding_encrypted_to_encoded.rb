class ChangeDecodingEncryptedToEncoded < ActiveRecord::Migration
  def change
    rename_column(:decodings, :encrypted, :encoded)
  end
end
