# Java Gradle CI/CD Project

Enterprise-grade Java 17 application with Gradle build automation and Docker Hub publishing via GitHub Actions. Demonstrates production-ready CI/CD pipeline with testing, multi-tag Docker builds, and secure secret management.

## ✨ Key Features

- **GitHub Actions CI/CD**: Automated build/test/publish on `main` pushes and PRs
- **Docker multi-tagging**: `latest` + commit SHA tags pushed to Docker Hub
- **Gradle caching**: Optimized dependency resolution via `setup-gradle` action
- **Secure secrets**: Docker Hub credentials via GitHub Secrets
- **JDK 17 Temurin**: Reproducible builds with Eclipse Temurin distribution

## 🛠 Tech Stack

| Category | Tools |
|----------|-------|
| Language | Java 17 |
| Build | Gradle (wrapper included) |
| Container | Docker Buildx |
| CI/CD | GitHub Actions |
| Runtime | Eclipse Temurin JDK 17 |

## 🚀 Quick Start

### Prerequisites
- Java 17 JDK
- Docker & Docker Compose
- Gradle (wrapper included)

Clone and build
git clone https://github.com/gurumech07/java-with-gradle.git
cd java-with-gradle

Local build & test
chmod +x gradlew
./gradlew build

Run with Docker (after building locally)
docker build -t gurumech07/java-with-gradle:latest .
docker run -p 8080:8080 gurumech07/java-with-gradle:latest

text

## 🐳 Docker Hub Integration

**Automated publishing via GitHub Actions:**
- **On `main` push**: Builds and pushes `latest` + `${{ github.sha }}` tags
- **Docker Hub repo**: `gurumech07/java-with-gradle`
- **Secure login**: Uses `DOCKERHUB_USERNAME` + `DOCKERHUB_TOKEN` secrets

**View your images:**
https://hub.docker.com/r/gurumech07/java-with-gradle

text

## 🔄 GitHub Actions Pipeline

Your `gradle.yml` automates the full lifecycle:

graph TD
A[Push/PR to main] --> B[Checkout code]
B --> C[Setup JDK 17]
C --> D[Setup Gradle + cache]
D --> E[Build with ./gradlew build]
E --> F[Docker Buildx setup]
F --> G[Login Docker Hub]
G --> H[Build & push image
latest + SHA tags]

text

**Triggers:**
- `push` to `main`
- `pull_request` to `main` (builds only, no push)

## 🔧 Setup Instructions

### 1. GitHub Secrets (Required)
Add to repo Settings > Secrets and variables > Actions:

DOCKERHUB_USERNAME = your-dockerhub-username
DOCKERHUB_TOKEN = your-dockerhub-access-token

text

### 2. Dockerfile (Expected structure)
Your repo must contain a Dockerfile in root
Example multi-stage build recommended:
FROM eclipse-temurin:17-jre-alpine AS runtime
COPY build/libs/*.jar app.jar
EXPOSE 8080
ENTRYPOINT ["java", "-jar", "/app.jar"]

text

### 3. Test locally
Verify build outputs
./gradlew build
find . -name ".jar" -o -name ".war"

Test Docker build
docker build -t local-test .

text

## 📊 Pipeline Metrics

| Step | Duration | Artifacts |
|------|----------|-----------|
| Gradle Build | ~2-4min | JAR/WAR files |
| Docker Build | ~1-2min | Multi-tagged images |
| Total (cached) | <5min | Docker Hub published |

## 🔐 Security & Best Practices

✅ **Permissions**: Minimal `contents:read`, `packages:write`, `id-token:write`  
✅ **Secrets**: No hardcoded credentials  
✅ **Caching**: Gradle dependencies cached between runs  
✅ **Reproducible**: Fixed action versions (checkout@v4, setup-java@v4)  

## 🤝 Contributing

1. Fork → Branch → `./gradlew build`
2. Update PR description with changes
3. Ensure Actions pass before merge

**Welcome**: Pipeline optimizations, security enhancements, Java 21 migration

## 📄 License

MIT License - see [LICENSE](LICENSE) © 2025 [Your Name]

## 👨‍💻 Author

[Gurubasav Yellur] | [LinkedIn](https://www.linkedin.com/in/gurubasavyellur) | DevSecOps Sysetm Manager

**Production-ready Java CI/CD pipeline → Ready for your LinkedIn portfolio!**
