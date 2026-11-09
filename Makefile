build:
	xtool dev build --triple arm64-apple-ios-simulator

watch:
	xtool dev -w

generate:
	swift package plugin --allow-writing-to-package-directory generate-code-from-openapi
