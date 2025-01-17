## To run:

```ruby
bundle install
irb -r './lib/game'
```

## Demo:

For the purpose of the demo, I put down some p statements. The script currently only updates the total score each frame is completed- a string ‘Frame complete’ will be printed to confirm this.

The user should input  a roll at a time. When 10 is submitted, the script deducts that it was a STRIKE.

```ruby
3.0.0 :001 > game = Game.new
 => #<Game:0x00007fefee9e8578 @frames=[]> 
3.0.0 :002 > game.add_roll(10)
"Frame 1 complete"
 => "Total score: 10" 
3.0.0 :003 > game.add_roll(3)
 => "Total score: 13" 
3.0.0 :004 > game.add_roll(7)
"Frame 2 complete"
 => "Total score: 30" 
3.0.0 :005 > game.add_roll(10)
"Frame 3 complete"
 => "Total score: 50" 
3.0.0 :006 > game.add_roll(10)
"Frame 4 complete"
 => "Total score: 70" 
3.0.0 :007 > game.add_roll(3)
 => "Total score: 76" 
3.0.0 :008 > game.add_roll(7)
"Frame 5 complete"
 => "Total score: 93" 
3.0.0 :009 > game.add_roll(2)
 => "Total score: 95" 
3.0.0 :010 > game.add_roll(8)
"Frame 6 complete"
 => "Total score: 105" 
3.0.0 :011 > game.add_roll(5)
 => "Total score: 110" 
3.0.0 :012 > game.add_roll(3)
"Frame 7 complete"
 => "Total score: 118" 
3.0.0 :013 > game.add_roll(10)
"Frame 8 complete"
 => "Total score: 128" 
3.0.0 :014 > game.add_roll(8)
 => "Total score: 136" 
3.0.0 :015 > game.add_roll(2)
"Frame 9 complete"
 => "Total score: 148" 
3.0.0 :016 > game.add_roll(10)
"Frame 10 complete"
 => "Total score: 168" 
3.0.0 :017 > game.add_roll(10)
 => "Total score: 178" 
3.0.0 :018 > game.add_roll(10)
 => "Total score: 188" 
3.0.0 :019 > game.add_roll(0)
[Traceback DELETED]
RuntimeError (round complete)
3.0.0 :020 > 
```

## Table of scores for the demo above (not part of the program):
![alt text](https://i.imgur.com/UKGzL69.png)

## Features:

- user starts a round
- user can add a roll at a time using ‘#add_roll(knocked_pins) method’
- the total score is currently calculated after each complete frame

## Features in development:

- user can print breakdown of the scores
- the total score should be updated each time a roll is added

## How the score is counted

1. The user inputs the roll
2. The program checks all existing frames for outstanding bonus rolls
3. The program creates a Frame if it is a strike, awaits another roll otherwise.

## Reflections:

Edge cases:

- given 2 strikes in a row, the first strike still has one bonus roll left

- given a strike in the 10th frame, 2 bonus rolls are allowed

(TBC)...

Notes:
- Frame and Game class- Game class seems dependent on Frame and not sure how to isolate tests

- Having made most methods private, not sure how to go about testing. Should the not-private methods be tested for calling the private methods? 

- still unsure about 'testing behaviour over test in this exercise'

## Bowling rules model:

![alt text](https://i.imgur.com/z4arXW4.jpg)

## Domain model (TBC):

![alt text](https://i.imgur.com/54Dmq6h.jpg)