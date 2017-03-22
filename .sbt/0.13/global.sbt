libraryDependencies += "com.lihaoyi" %% "pprint" % "0.4.3"

libraryDependencies += "com.lihaoyi" % "ammonite" % "0.8.2" % "test" cross CrossVersion.full

initialCommands in (Test, console) := """ammonite.Main().run()"""

cancelable in Global := true

import coursier.CoursierPlugin.autoImport._

coursierUseSbtCredentials := true
