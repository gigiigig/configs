resolvers += Resolver.sonatypeRepo("snapshots")

resolvers += Classpaths.sbtPluginReleases

addSbtPlugin("org.ensime" % "sbt-ensime" % "1.12.11")

addSbtPlugin("io.get-coursier" % "sbt-coursier" % "1.0.0-RC1")

addSbtPlugin("com.softwaremill.clippy" % "plugin-sbt" % "0.5.3")

