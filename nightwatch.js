module.exports = {
  src_folders : ['test'],
  'test_settings' : {
    'default' : {
      launch_url: 'http://ondemand.saucelabs.com:80',
      selenium_port: 80,
      selenium_host: 'ondemand.saucelabs.com',
      silent: false,
      // MOVE THESE TO user.json
      // username: '',
      // access_key: '',
      globals: {
        waitForConditionTimeout: 10000,
      },
    },
    chrome: {
      desiredCapabilities: {
        browserName: 'chrome',
        platform: 'OS X 10.11',
        version: '47',
      },
    },
    ie11: {
      desiredCapabilities: {
        browserName: 'internet explorer',
        platform: 'Windows 10',
        version: '11.0',
      },
    },
  },
};
