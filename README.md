# Updog
**NOTE: Updog is still in progess!**

## ABOUT
What's **Updog?** Nothing much, what's up with you ;)
**Updog** is a digital journal that provides a safe space for users to reflect on their innermost thoughts and feelings. This was a project I created for a User Interfaces class, and I was able to develop proficiency in Dart and Flutter, strengthen my UI/UX design skills, and learn how thoughtful design choices can improve usability, accessibility, and the overall user experience. 

## HOW TO RUN
Updog is available as a web application hosted on AWS!  
- https://drpbc6fvgdp5s.cloudfront.net  
I deployed the Flutter Web application to Amazon S3 for storage and used Amazon CloudFront to distribute the application globally over HTTPS. THe S3 bucket remains private, with CloudFront Origin Access Control securely controlling access to the application files.

Alternatively, if you'd like to run Updog locally, you can follow the steps below.

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

### 3. Install Flutter + Dependencies
**Install Flutter:**  
Follow the official Flutter installation guide for your operating system:  
https://docs.flutter.dev/get-started/install

**Install Dependencies:**
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