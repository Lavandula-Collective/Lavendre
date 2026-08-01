## Building from Source

> [!IMPORTANT]
> This repository is intended for development and contributions only. Please read the project's [license](https://github.com/aerhazu/Lavendre/blob/master/LICENSE.md) before redistributing or publishing modified versions of Lavendre.

### Requirements

Before you begin, install:

- [Temurin® JDK 21](https://adoptium.net/temurin/releases/?version=21)
- [Git](https://git-scm.com/install/)
- [Go](https://golang.org/dl/) (required for [Packwiz](https://github.com/packwiz/packwiz))
- [IntelliJ IDEA](https://www.jetbrains.com/idea/) (recommended)

### Clone the Repository

```bash
git clone https://github.com/aerhazu/Lavendre.git
cd Lavendre
```

### Install Packwiz

Install Packwiz using Go:

```bash
go install github.com/packwiz/packwiz@latest
```
Be patient, it has to download and compile dependencies as well!

Verify the installation:

```bash
packwiz version
```

If the command isn't recognized, make sure your Go binary directory is added to your system's `PATH`.

### Start the Packwiz Server

Navigate to the Packwiz directory and start the local server:

```bash
cd packwiz
packwiz serve
```

Leave this terminal running while developing. At default, the server will be available at:

```
http://localhost:8080
```

### Open the Project

Open the project in IntelliJ IDEA and allow Gradle to finish importing the project.

### Launch Minecraft

Run the `runClient` Gradle task.

Lavendre will automatically:

- Verify the Packwiz server is running.
- Download or update all Packwiz-managed mods.
- Synchronize development files.
- Launch the Minecraft development instance.

If the Packwiz server isn't running, Gradle will stop and display an error.

### Configuration Changes

When adding or modifying a configuration file that should be included in the final modpack:

1. Add the file to the exceptions in `.gitignore` so Git tracks it.
2. Add the file or folder to the `syncConfigs` task in `build.gradle` so it is automatically synchronized between the development instance (`run/config`) and the Packwiz source (`packwiz/config`).

This synchronization is **not automatic**. Any new configuration files must be added manually to both locations to ensure they are included in the repository and the final modpack build.


### Packaging the Modpack

Build a Modrinth-ready ZIP:

```bash
./gradlew pack
```

The packaged modpack will be located in:

```
build/distributions/
```

To create a numbered developer build:

```bash
./gradlew pack -Pbuild=1
```

Example output:

```
Lavendre-0.0.1+1.21.1-build-1.zip
```

### Useful Commands

| Command | Description |
|---------|-------------|
| `packwiz serve` | Starts the local Packwiz server. |
| `./gradlew runClient` | Downloads mods (if needed) and launches Minecraft. |
| `./gradlew installPack` | Manually synchronizes Packwiz-managed mods. |
| `./gradlew pack` | Packages the modpack for distribution. |
| `./gradlew pack -Pbuild=1` | Packages a numbered developer build. |

### Packwiz

Lavendre uses **Packwiz** to manage mod dependencies. Instead of storing mods in the repository, Packwiz tracks their download sources, versions, and hashes, ensuring every developer uses the same files while keeping the repository lightweight.

When `runClient` is executed, Gradle automatically uses the Packwiz installer to download or update all required mods into the development instance.

Most of the time, you'll only need these commands:

| Command                            | Description |
|------------------------------------|-------------|
| `packwiz serve`                    | Starts the local Packwiz server. |
| `packwiz refresh`                  | Refreshes the Packwiz index after editing metadata. |
| `packwiz modrinth add <slug/link>` | Adds a mod from Modrinth. |
| `packwiz update --all`             | Updates all mods. |
| `packwiz update <mod>`             | Updates a specific mod. |
| `packwiz remove <mod>`             | Removes a mod. |

> [!NOTE]
> You do **not** need to export the modpack with Packwiz. Use `./gradlew pack` to generate the final zip release.