[English](./README.md) | [日本語](./README_ja.md)

# misskey-railway-template
This is a template for deploying Misskey on [Railway](https://railway.app).

## How to Use

### 1. Click on 'Deploy on Railway'

[![Deploy on Railway](https://railway.app/button.svg)](https://railway.app/template/8bBGvg?referralCode=mveF9L)

### 2. Set Environment Variables
![](images/setup1.png)

Set the environment variables. Misskey uses a yml file for configuration, but this template allows the use of environment variables with a custom Docker image.

In this Docker image, a yml file is generated at container startup based on the environment variables prefixed with `MISSKEY`.

Example:

```
MISSKEY__DB__USER=db-user
MISSKEY__DB__PASS=db-pass
```
↓
```yml
db:
  user: db-user
  pass: db-pass
```

For detailed rules of the conversion, refer to [read-env's README](https://github.com/yatki/read-env), and for more information on each setting of Misskey, refer to [Misskey's .config/example.yml](https://github.com/misskey-dev/misskey/blob/9eae82de1d4f9157602451e26e734c8f4ae94bea/.config/example.yml).

### 3. After Completing the Settings, Click 'Deploy'
You will be able to deploy after all settings are completed.

### 4. A Few Minutes Later, Click on the 'Misskey' Service and Access the URL
The URL will be displayed in the 'Deployments' section as shown below.

![](images/setup2.png)

That's it!

![](images/setup3.png)

## ⚠️⚠️Caution⚠️⚠️
- Uploaded images are stored in the mounted volume. The volume capacity is 5GB, so it is recommended to set up S3 or similar from the start if needed.
- Railway charges based on usage, so please do not increase your followers excessively. [You can also set limits on usage from the settings.](https://docs.railway.app/reference/usage-limits)
