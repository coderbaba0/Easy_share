# Easy_share A Chrome Extension Built in Flutter

This is a Chrome Extension Utility tool Developed in flutter. using this tool you can automatically create a QR code of your current opened tab. 

![ezgif-3-f2dc0722fe](https://github.com/coderbaba0/Easy_share/assets/128967105/53fde32a-3548-4178-87f2-e5a29b3f7a37)

## Getting Started


To use this project as a Chrome extension, follow the steps below:

1. Clone this project using:
   
    ```sh
    git clone https://github.com/coderbaba0/Easy_share.git
    ```

2. From the project directory, run:
   
   ```sh
   flutter build web --web-renderer html --csp
   ```

3. Go to the following URL from Chrome browser:
   
   ```url
   chrome://extensions
   ```

4. Enable the **Developer mode**.

5. Click **Load unpacked**. Select the `<project_dir>/build/web` folder.
