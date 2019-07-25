require "pathname"
require "language_pack/java"

# General Language Pack module
module LanguagePack

  # detects which language pack to use
  # @param [Array] first argument is a String of the build directory
  # @return [LanguagePack] the {LanguagePack} detected
  def self.detect(*args)
    Dir.chdir(args.first)

    pack = [ Java ].detect do |klass|
      klass.use?
    end

    pack ? pack.new(*args) : nil
  end

end


