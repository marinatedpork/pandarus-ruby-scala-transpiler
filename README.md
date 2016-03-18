#### Ruby to Scala Transpiler

This script is meant to transpile all models in [Instructure's Pandarus gem](https://github.com/instructure/pandarus) (i.e. The code contained within the **ruby/** directory) from Ruby into Scala. **The goal here was to create a [Canvas LMS](https://github.com/instructure/canvas-lms) API client in Scala without having to write it all out by hand**, so why not just write 300 lines of code that writes 3000 lines of code for you? It's actually pretty neat. To run the script, just run:

    ruby codepiler.rb

The resulting Scala files will be output into the **scala/** directory. Future versions will be able to handle active records migrations and SQL schemas.