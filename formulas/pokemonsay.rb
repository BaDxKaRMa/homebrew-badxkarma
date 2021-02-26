class Pokemonsay < Formula
  desc '"pokemonsay" is like "cowsay" but for pokémon.'
  homepage "https://github.com/badxkarma/pokemonsay"
  url "https://github.com/badxkarma/pokemonsay/tarball/v1.0.0"
  sha256 "1494bac29d009b8b2c2a0d75d715fe5a8e77a79f5dc62d9b5cd5ba589af0f5e5"
  version "v1.0.0"

  depends_on "cowsay" => :recommended
  depends_on "coreutils" => [:recommended, "with-default-names"] if not OS.linux?

  # `with-default-names` installs `gshuf` as `shuf`.

  # `coreutils` can't be installed on linux AFAIK. But linux already
  # has `shuf`, so no need for that.

  def install
    system "cp", "-r", "./cows", "#{prefix}/cows"
    system "cp", "pokemonsay.sh", "pokemonsay"
    system "cp", "pokemonthink.sh", "pokemonthink"

    inreplace "pokemonsay", /^pokemon_path=.*$/, "pokemon_path=#{prefix}/cows"
    # inreplace "pokemonsay", /\bshuf\b/, "gshuf" if not OS.linux?

    bin.install "pokemonsay"
    bin.install "pokemonthink"
  end

  test do
    system "false"
  end
end
