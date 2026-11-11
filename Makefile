build:
	xtool dev build --triple arm64-apple-ios-simulator

watch:
	xtool dev -w

generate:
	swift package plugin --allow-writing-to-package-directory generate-code-from-openapi

snapshots:
	@rm -rf snapshot-images
	TEST_RUNNER_SNAPSHOTS_EXPORT_DIR="$$PWD/snapshot-images" \
		xcodebuild test \
			-skipMacroValidation -scheme SwiftBharat26 \
			-destination '$(or $(SIM_DEST),platform=iOS Simulator,name=iPhone 18 Pro)'

e2e: build
	@+$(MAKE) e2e-run

e2e-run:
	npx --workspace=e2e -- e2e run

package:
	bundle exec fastlane package
