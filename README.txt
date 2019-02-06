Brovers

This is some code to simulate Mars Rovers. "Brovers" was a name chosen to poke
fun at "Brogrammer" culture, and likens it to the autonomous rovers being
simulated (think "NPC meme").

If you have Bundler, a bundle in the project root and you should be good to go.

To feed it new input, simply overwrite input.txt.

The program can be run by executing `bin/brovers`.

Here are some decisions I made, and the rationale behind them:

1) FauxO
  I think this term was coined by Gary Bernhardt. Anyway, this involves
  writing what are traditionally mutating methods as methods which
  return changed copies of the receiver.

2) Value objects
  Vector2d is an example of a value object, it doesn't mutate anything, but
  reifies the concept of a 2d vector, such as a point, or a translation.
  It doesn't do IO or anything complex, so doesn't need to be mocked in tests.
  These give the same benefits as mock objects, but have the added benefit
  that you are actually integrating against the object that will be used
  in production.

3) Code as state machines
  While I didn't use a library, instead of lots of nested conditionals,
  the code was written with a preference for looking up transitions based
  on the current state. This reduces cyclomatic complexity and lots of bugs.

4) Keyword arguments
  These were used instead of positional arguments, in order to reduce coupling
  between components. Client intent is much more transparent, so it results in
  less bugs

5) What to test
  I tried to make a dumb shell around a smart core. The shell performed nasty
  things like IO, and the objects with business rules could be blissfully
  ignorant of that.
  As a result, I focussed on TDDing the behaviour of the business rules, and
  forgoing unit testing of the shell objects, but saving the testing of their
  behaviour for integration tests.

6) Unspecified behaviour
  What should be done when a rover reaches an impassable location, such as the
  end of the plateau, or another rover?
  For this case, I simply made the rover unable to move to such a location.

Completion status

This project needs some more testing. The cucumber scenario was difficult to
get working, I think it is grabbing the terminal so my IO isn't working
in the steps definition file. Other classes need some serious testing.
On the bright side, things seem to be wired up ok.

This is pretty barebones, in terms of features, but I wanted to focus on
code quality, and to try to get arbitrary inputs to work. It should work not
only on _very_ large files, but on files with _very_ large lines of command
input. This is due to the method of reading input in streamed chunks,
not simply lines, or even slurping the file in all at once.
