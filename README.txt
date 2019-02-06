Brovers

This is some code to simulate Mars Rovers. "Brovers" was a name chosen to poke
fun at "Brogrammer" culture, and likens it to the autonomous rovers being
simulated (think "NPC meme").

If you have Bundler, a bundle in the project root and you should be good to go.

The program can be run by executing `bin/brovers`.

Here are some decisions I made, and the rationale behind them:

1) FauxO
  I think this term was coined by Gary Bernhardt. Anyway, this involves
  writing what are traditionally mutating methods as methods which
  return changed copies of the receiver.

2) Value objects
  Vector2d is an example of a value object, it doesn't mutate anything, but
  reifies the concept of a 2d vector, such as a point, or a translation.

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

Completion status

This project is almost complete, but is not yet functional. You may observe
the intent by running the only cucumber feature with `cucumber`, or run any
of the specs with `rspec`, both in the project root.
