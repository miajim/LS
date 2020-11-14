=begin
Polycarpus works as a DJ in the best Berland nightclub, and he often uses dubstep
music in his performance. Recently, he has decided to take a couple of old songs
and make dubstep remixes from them.

Let's assume that a song consists of some number of words (that don't contain WUB).
To make the dubstep remix of this song, Polycarpus inserts a certain number of
words "WUB" before the first word of the song (the number may be zero), after the
last word (the number may be zero), and between words (at least one between any
pair of neighbouring words), and then the boy glues together all the words,
including "WUB", in one string and plays the song at the club.

For example, a song with words "I AM X" can transform into a dubstep remix as
"WUBWUBIWUBAMWUBWUBX" and cannot transform into "WUBWUBIAMWUBX".

Recently, Jonny has heard Polycarpus's new dubstep track, but since he isn't into
modern music, he decided to find out what was the initial song that Polycarpus remixed.
Help Jonny restore the original song.

Input
The input consists of a single non-empty string, consisting only of uppercase
English letters, the string's length doesn't exceed 200 characters

Output
Return the words of the initial song that Polycarpus used to make a dubsteb remix.
Separate the words with a space.

Examples
song_decoder("WUBWEWUBAREWUBWUBTHEWUBCHAMPIONSWUBMYWUBFRIENDWUB")  =>  WE ARE THE CHAMPIONS MY FRIEND

# Notes
Inputs
  - one string, all caps, A-Z only, no spaces or special characters
Outputs
  - one string (same as input string with "WUB"s removed), original words/chars joined
    by spaces
Rules/Req's
  - 0 or more 'WUB's in front of the first word of a song
  - at least 1 'WUB' in between words
  - 0 or more 'WUB's after the last word of a song
Questions
  -
  -
Algorithm
  - replace all "WUB" substrings with nothing ("")
    - use a global substitution for "WUB"
  - ensure there is only one space between remaining words
    - split the string at the remaining words, add a space to join
=end

# This algorithm only works for one letter words in the song
# def song_decoder(str)
#   str.gsub("WUB", "").split("").join(" ")
# end



=begin
Updated Algorithm
  - replace all "WUB" substrings with a space (" ")
    - use a global substitution for "WUB"
  - ensure there is only one space between remaining words
    - split the string at spaces, leaving the remaining words as elements in an arr
    - join the elements in the array (song words) with one space in between words
=end

def song_decoder(song)
  song.gsub("WUB", " ").split(" ").join(" ")
end

p song_decoder("AWUBBWUBC") == "A B C"
p song_decoder("AWUBWUBWUBBWUBWUBWUBC") == "A B C"
p song_decoder("WUBAWUBBWUBCWUB") == "A B C"
