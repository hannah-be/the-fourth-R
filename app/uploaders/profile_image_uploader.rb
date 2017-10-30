class ProfileImageUploader < Shrine
  include ImageProcessing::MiniMagick

  plugin :activerecord
  plugin :determine_mime_type
  plugin :logging, logger: Rails.logger
  plugin :remove_attachment
  plugin :store_dimensions
  plugin :validation_helpers
  plugin :versions, names: [:original, :large, :medium, :small, :thumb]

  Attacher.validate do
    validate_max_size 2.megabytes, message: 'is too large (max is 2 MB)'
    validate_mime_type_inclusion ['image/jpg', 'image/jpeg', 'image/png', 'image/gif']
  end

  def process(io, context)
    if context[:phase] == :store
      size_700 = resize_to_limit!(io.download, 700, 700)
      size_300 = resize_to_limit(size_700,    300, 300)
      size_100 = resize_to_limit(size_300,    100, 100)
      thumb = resize_to_limit(size_100, 70, 70)

      { original: io, large: size_700, medium: size_300, small: size_100, thumb: thumb }
    end
  end
end