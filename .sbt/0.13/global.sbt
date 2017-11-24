libraryDependencies += "com.lihaoyi" %% "pprint" % "0.5.3"
// PPrint

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

// Sbt console color
initialize ~= { _ =>
  val ansi = System.getProperty("sbt.log.noformat", "false") != "true"
  if (ansi) System.setProperty("scala.color", "true")
}
