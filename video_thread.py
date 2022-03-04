from selenium import webdriver
from selenium.webdriver.chrome.options import Options
import time
import sys

path = '/Users/dinesh-5321/Downloads/chromedriver'
sys.path.append(path)


options = Options()
options.headless = True

# initializing webdriver for Chrome
links_file = open('output.txt', 'r')
links = links_file.readlines()
for link in links:
    try:
        driver = webdriver.Chrome(options=options)
        driver.get(link)
        driver.find_element_by_xpath(
            "//div[@id='movie_player']/div[4]/button").click()

        i = 0
        while i == 0:
            status = driver.find_element_by_class_name("ytp-time-current").text
            print(status)
            if status == "":
                print("Video Ended")
                driver.quit()
                i = 1
            time.sleep(10)
    except Exception as e:
        print(e)
        print("Error in link: ", link)
