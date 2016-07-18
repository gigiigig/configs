resolvers += Resolver.sonatypeRepo("snapshots")

addSbtPlugin("com.kalmanb.sbt" % "sbt-ctags" % "0.3.0")

resolvers += Classpaths.sbtPluginReleases

addSbtPlugin("org.scoverage" % "sbt-scoverage" % "1.0.4")

addSbtPlugin("net.virtual-void" % "sbt-dependency-graph" % "0.7.5")

addSbtPlugin("org.ensime" % "sbt-ensime" % "1.0.0")

