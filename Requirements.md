# Requirements for difficult-customer gem

## Config YAML format

```yml
messages:
  - message:
      priority: low
      appearance: banner # available options: banner, alert, page, page_destruction, default "banner" for low
      position: bottom # available options for banner: top, left, right, bottom, middle, default bottom
      color: yellow # default "yellow" for low
      text: 'Hi there. The payment date is due soon.'
      text_color: black # default "black" for low
      frequency: after-sign-in # available options: after-sign-in, every-N-requests, every-request
      start_date: 2019-05-01 # leave blank if you don't want to define time frames
      end_date: 2019-05-31 # leave blank if you don't want to define time frames
  - message:
      priority: medium
      appearance: alert # available options: banner, alert, page, page_destruction, default "alert" for medium
      color: orange # default "orange" for medium
      text: 'This is getting to be annoying. Please pay.'
      text_color: white # default "white" for medium
      frequency: every-10-requests
      start_date: May 1st 2019 # leave blank if you don't want to define time frames
      end_date: May 31 2019 # leave blank if you don't want to define time frames
  - message:
      priority: high
      appearance: page # available options: banner, alert, page, page_destruction, default "page" for high
      color: red # default "red" for high
      text: 'We are going to shut down the app tomorrow. Last chance to get this service working'
      text_color: white # default "white" for high
      frequency: every-2-requests
      start_date: 1.05.2019 # leave blank if you don't want to define time frames
      end_date: 31.05.2019 # leave blank if you don't want to define time frames
  - message:
      priority: high
      appearance: page_destruction # available options: banner, alert, page, page_destruction, default "page" for high
      color: red # default "red" for high
      text: 'We are going to shut down the app tomorrow. Last chance to get this service working'
      text_color: white # default "white" for high
      frequency: every-request
      start_date: 1.06.2019 # leave blank if you don't want to define time frames
      end_date: 15.08.2019 # leave blank if you don't want to define time frames
```
