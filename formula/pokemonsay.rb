class Pokemonsay < Formula
  desc '"pokemonsay" is like "cowsay" but for pokémon.'
  homepage "https://github.com/badxkarma/pokemonsay"
  url "https://github.com/badxkarma/pokemonsay/tarball/v1.1.0"
  sha256 "b71a3a993f3402f7f9c8b5be169437ce252360b841296cb5539e11e1b9386bb9"
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
