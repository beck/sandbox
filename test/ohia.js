module.exports = {

  beforeEach: browser => {
    browser
      .url('http://localhost:8080');
      //.waitForElementVisible('#hi');
  },

  'ohai test': browser => {

    // this shouldn't work, there is nothing running
    browser.expect.element('h1').to.be.present;
    browser.getText('#hi', function(result) {
      console.log('what?', result.value);
      this.assert.equal(result.value, 'please-break');
    });

  },

  after: browser => browser.end(),

};
