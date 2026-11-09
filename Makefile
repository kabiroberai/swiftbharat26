build:
	xtool dev build --triple arm64-apple-ios-simulator

watch:
	xtool dev -w

generate:
	swift package plugin --allow-writing-to-package-directory generate-code-from-openapi

snapshots:
	@rm -rf snapshot-images
	SIMCTL_CHILD_SNAPSHOTS_EXPORT_DIR="$$PWD/snapshot-images" xtool dev -s

e2e: build
	@+$(MAKE) e2e-run

e2e-run:
	npx --workspace=e2e -- e2e run
