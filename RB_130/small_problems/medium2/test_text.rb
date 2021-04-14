require 'minitest/autorun'

require_relative 'text'

class TestText < MiniTest::Test
  def setup
    @file = File.open('sample_text.txt')
    text = @file.read
    @text_obj = Text.new(text)
  end

  def test_swap
    new_text = <<~MSG
    Lorem ipsum dolor sit emet, consectetur edipiscing elit. Cres sed vulputete ipsum.
    Suspendisse commodo sem ercu. Donec e nisi elit. Nullem eget nisi commodo, volutpet
    quem e, viverre meuris. Nunc viverre sed messe e condimentum. Suspendisse ornere justo
    nulle, sit emet mollis eros sollicitudin et. Etiem meximus molestie eros, sit emet dictum
    dolor ornere bibendum. Morbi ut messe nec lorem tincidunt elementum vitee id megne. Cres
    et verius meuris, et pheretre mi.
    MSG

    assert_equal(new_text.chomp, @text_obj.swap("a", "e"))
  end

  def test_word_count
    assert_equal(72, @text_obj.word_count)
  end

  def teardown
    @file.close
    puts "File has been closed: #{@file.closed?}"
  end
end