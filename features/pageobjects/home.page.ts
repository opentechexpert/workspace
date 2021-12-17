import { ChainablePromiseElement } from 'webdriverio';

import Page from './page';

/**
 * sub page containing specific selectors and methods for a specific page
 */
class HomePage extends Page {
    /**
     * define selectors using getter methods
     */
    // public get inputUsername(): ChainablePromiseElement<Promise<WebdriverIO.Element>> {
    //     return $('#username');
    // }

    // public get inputPassword(): ChainablePromiseElement<Promise<WebdriverIO.Element>> {
    //     return $('#password');
    // }

    // public get btnSubmit(): ChainablePromiseElement<Promise<WebdriverIO.Element>> {
    //     return $('button[type="submit"]');
    // }

    /**
     * a method to encapsule automation code to interact with the page
     * e.g. to login using username and password
     */
    public async login(username: string, password: string): Promise<void> {
        // await this.inputUsername.setValue(username);
        // await this.inputPassword.setValue(password);
        // await this.btnSubmit.click();
    }

    public async openTabs(numberOfTabs: number, interval: number): Promise<void> {

        for (let index = 0; index <= numberOfTabs; index++) {
            // open url
            await browser.url("https://google.com");
            await browser.pause(2000);

            await browser.newWindow("https://webdriver.io");
            await browser.pause(2000);

            await browser.newWindow("https://yahoo.io");
            // await browser.execute((url) => {
            //     window.open(url);
            // }, "http://yahoo.com");
            await browser.pause(2000);

            await browser.newWindow("http://twitter.com");
            // await browser.execute((url) => {
            //     window.open(url);
            // }, "http://twitter.com");
            await browser.pause(2000);

            await browser.switchWindow("google.com");
            await browser.pause(2000);

            await browser.switchWindow("webdriver.io");
            await browser.pause(2000);

            await browser.switchWindow("yahoo.com");
            await browser.pause(2000);
            
            await browser.switchWindow("twitter.com");
            await browser.pause(2000);

        }

    }

    /**
     * overwrite specific options to adapt it to page object
     */
    public open(): Promise<string> {
        return super.open('');
    }
}

export default new HomePage();
