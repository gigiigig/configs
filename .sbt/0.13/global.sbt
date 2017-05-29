// PPrint
libraryDependencies += "com.lihaoyi" %% "pprint" % "0.4.3"

// Ammonite
libraryDependencies += "com.lihaoyi" % "ammonite" % "0.9.3" % "test" cross CrossVersion.full

initialCommands in (Test, console) := """ammonite.Main().run()"""

// Coursier
import coursier.CoursierPlugin.autoImport._

coursierUseSbtCredentials := true

// Clippy
import com.softwaremill.clippy.ClippySbtPlugin._

clippyColorsEnabled := true

// Ensime
import org.ensime.EnsimeKeys._

ensimeServerVersion in ThisBuild := "2.0.0-M1" // or "1.0.1"

