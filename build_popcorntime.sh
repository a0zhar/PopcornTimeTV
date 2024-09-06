#!/bin/bash

# Define color codes
GREEN='\033[0;32m'
BLUE='\033[0;34m'
RED='\033[0;31m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# Function to get the current timestamp in HH:MM:SS format
timestamp() {
    date +"%T"
}

# Function to print success messages in green with "+"
print_success() {
    echo -e "${GREEN}[$(timestamp)][+] ${1}${NC}"
}

# Function to print informational messages in blue with "?"
print_info() {
    echo -e "${BLUE}[$(timestamp)][?] ${1}${NC}"
}

# Function to print warning messages in yellow with "!"
print_warning() {
    echo -e "${YELLOW}[$(timestamp)][!] ${1}${NC}"
}

# Function to print error messages in red with "x"
print_error() {
    echo -e "${RED}[$(timestamp)][x] ${1}${NC}"
}

# Step 1: Select the latest Xcode version
print_info "Selecting the latest Xcode version..."
sudo xcode-select -s /Applications/$(ls /Applications | grep -E '^Xcode.*\.app$' | sort -rV | head -n 1)
if [ $? -eq 0 ]; then
    print_success "Successfully selected the latest Xcode version."
else
    print_error "Failed to select Xcode version."
    exit 1
fi

# Step 2: Accept Xcode license
print_info "Accepting Xcode license..."
sudo xcodebuild -license accept
if [ $? -eq 0 ]; then
    print_success "Xcode license accepted."
else
    print_error "Failed to accept Xcode license."
    exit 1
fi

# Step 3: Install dependencies if cache misses
print_info "Installing dependencies..."
gem install bundler
bundle install
pod repo update
pod install
if [ $? -eq 0 ]; then
    print_success "Dependencies installed successfully."
else
    print_error "Failed to install dependencies."
    exit 1
fi

# Step 4: Build the Xcode project
print_info "Building the Xcode project for tvOS..."
set -o pipefail && \
xcodebuild archive \
    -archivePath $RUNNER_TEMP/popcorntime.xcarchive \
    -project PopcornTime.xcodeproj \
    -scheme PopcornTimetvOS \
    -sdk appletvos \
    -configuration Debug \
    CODE_SIGNING_REQUIRED=NO \
    CODE_SIGNING_ALLOWED=NO \
    ONLY_ACTIVE_ARCH=NO | tee build.log | xcpretty
if [ $? -eq 0 ]; then
    print_success "Xcode project built successfully."
else
    print_error "Failed to build the Xcode project."
    exit 1
fi

# Step 5: Generate unsigned debug IPA
print_info "Generating unsigned debug IPA..."
cd ~
mkdir Payload
mv ~/Library/Developer/Xcode/Archives/*/*/Products/Applications/*.app ~/Payload/
zip -r PopcornTimeTV.ipa Payload
if [ $? -eq 0 ]; then
    print_success "Unsigned debug IPA generated successfully."
else
    print_error "Failed to generate unsigned debug IPA."
    exit 1
fi
