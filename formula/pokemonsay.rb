class Pokemonsay < Formula
  desc '"pokemonsay" is like "cowsay" but for pokémon.'
  homepage "https://github.com/badxkarma/pokemonsay"
  url "https://github.com/badxkarma/pokemonsay/tarball/v1.1.0"
  sha256 "9717b1a871db79c15f056b7852f22936162a6e660b88c49fd1db2afe7bc74fa8"
  version "v1.1.0"

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
