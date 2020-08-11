# EaselQA
EaselQA is an Open Source, Codeless, End to End Test automation framework developed by Dataphion. Please visit [EaselQA](https://easelqa.com) for more details. Application is still in Beta phase. Please share your feedback at support@dataphion.com

  ### Getting Started
  Application can be installed with a single command using docker-compose.
  ### Pre-Requisite
  - Docker and docker-compose must be installed.

  ### Installation Steps
  ```
  $ git clone https://github.com/dataphion/EaselQA.git
  $ cd EaselQA
  $ docker-compose up
  ```
  Below components will be installed as part of installation.
  1. Postgres.
  2. RabbitMQ.
  3. Base Application.
  4. Image processing service.
  5. API and DB services.

[View Documentation](https://documentation.easelqa.com)

# Setup web application testing
  Please follow the steps below to setup web application testing.
  - Register user account in the application. (http://localhost:4200)
  - Download the latest [selenium webdriver](https://www.selenium.dev/downloads)
  - Run the webdriver
  - Enter the webdriver connection details in settings page of the application. If you're running the jar in same instance then provide the system ip instead of localhost/127.0.0.1.
  ![Selenium Settings](https://github.com/dataphion/EaselQA/raw/master/screenshots/selenium_settings.png)
  - Download the Chrome Plugin from [Here](https://drive.google.com/file/d/1raxN9eEOdTCmGn7lnPi8JMfmWmQnkSxH/view?usp=sharing) and extract the file(This will create a folder 'build'). Will be available in official Chrome Store shortly.
  - In chrome browser enter chrome://extensions in the address bar, Click on 'Load Unpacked' button and point it to the build folder.
  - Once the extension is installed, please enter the application URL and registered credentials. You're all set to record your first testcase.

  ### Instructions for API testing and Mobile application testing can be found in the detailed documentation.
