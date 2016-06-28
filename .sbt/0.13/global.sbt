net.virtualvoid.sbt.graph.Plugin.graphSettings

libraryDependencies += "com.lihaoyi" %% "pprint" % "0.4.1"

libraryDependencies += "com.lihaoyi" % "ammonite-repl" % "0.6.2" % "test" cross CrossVersion.full

initialCommands in (Test, console) := """ammonite.repl.Main().run()"""

cancelable in Global := true

