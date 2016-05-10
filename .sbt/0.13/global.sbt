 net.virtualvoid.sbt.graph.Plugin.graphSettings

 libraryDependencies += "com.lihaoyi" % "ammonite-repl" % "0.5.7" % "test" cross CrossVersion.full

 libraryDependencies += "com.lihaoyi" %% "pprint" % "0.3.9"

 initialCommands in (Test, console) := """ammonite.repl.Main.run("")"""

 cancelable in Global := true

