# Updog
**NOTE: Updog is still in progess**

## ABOUT
**Updog** is an encrypted digital journal that provides a safe space for users to reflect on their innermost thoughts and feelings.

## HOW TO RUN
### 1. Download the Project

**Option A: Download ZIP**
- Click the green "Code" button at the top of this repository
- Select "Download ZIP"
- Extract the ZIP file to your desired location

**Option B: Clone with Git**
```bash
git clone https://github.com/sxrah404/updog.git
```

### 2. Navigate to Project Directory
```bash
cd path/to/updog
```

### 3. Install Dependencies
```bash
flutter pub get
```

### 4. Enable Desktop Support

**For macOS:**
```bash
flutter config --enable-macos-desktop
```

**For Windows:**
```bash
flutter config --enable-windows-desktop
```

### 5. Run the Application

**For macOS:**
```bash
flutter run -d macos
```

**For Windows:**
```bash
flutter run -d windows
```

### 6. Build Standalone App (Optional)

**For macOS:**
```bash
flutter build macos
```
The app will be located at: `build/macos/Build/Products/Release/updog.app`

**For Windows:**
```bash
flutter build windows
```
The app will be located at: `build/windows/runner/Release/updog.exe`
