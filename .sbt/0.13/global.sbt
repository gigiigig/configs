net.virtualvoid.sbt.graph.Plugin.graphSettings

libraryDependencies += "com.lihaoyi" %% "pprint" % "0.4.1"

libraryDependencies += "com.lihaoyi" % "ammonite" % "0.7.0" % "test" cross CrossVersion.full

initialCommands in (Test, console) := """ammonite.Main().run()"""

cancelable in Global := true

import coursier.CoursierPlugin.autoImport._

coursierUseSbtCredentials := true
