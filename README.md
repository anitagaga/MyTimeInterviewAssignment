#### MyTime-Automation

This project contains the automation scripts for MyTime. The scripts are developed using the following technologies:
Python 3.9
Selenium 3.141.0
Robot Framework 3.2.2

---

## The Project Architecture

At the most basic level, the architecture of the VendorLine Automation project is as follows:

origin
	/resources
		/components
		/poms
		main.txt
		setups.txt
	/tests
		test1

origin: MyTime-automation
* /tests: contains all test suite files of the project.
* /assets: contains anything you need as input for your tests (json files, text files, csv files, templates...). 
* /libraries: any other libraries (python, javascript...) needed to run tests can be installed here.
* /resources: all reusable elements of the project are included here, for example: the basic test set up, the basic test teardown, keywords that are used across different test cases, etc. 
	/components
	/poms: A Page Object Model, or POM, is meant to organize code for pages to be manageable and maintainable. POMs are implemented using Page Resource files so that they are easy to view and edit on Robot Framework. 
---

## Run test cases

1. Run test cases with the command below. It will create a new 'results' folder with results files (log.html, output.xml, report.html)
 
robot -d results {Absolute path to the test}

e.g. robot -d results /Users/anitagagarina/PycharmProjects/pythonProject/tests/test1.robot
