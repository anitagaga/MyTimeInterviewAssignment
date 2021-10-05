#### MyTime-automation

This project contains the automation scripts for MyTime. The scripts are developed using the following technologies:
Python 3.9
Selenium 3.141.0
Robot Framework 3.2.2

---

## The Project Architecture

At the most basic level, the architecture of the VendorLine Automation project is as follows:

master
	/test_suites
	/assets
	/libraries
	/resources
		/components
		main.txt
		/poms
		setups.txt

master: vendorline-automation
* /test_suites: contains all suite files of the project. A suite file corresponds to a section or subsection on TestRail.
* /assets: contains anything you need as input for your tests (json files, text files, csv files, templates...). You should include subfolders for each component.
* /libraries: any other libraries (python, javascript...) needed to run tests can be installed here.
* /resources: all reusable elements of your project should be included here, for example: the basic test set up, the basic test teardown, keywords that can be used across different test cases, etc. Resources should be a useful library for all the test cases to call upon!
	/components
	/poms: A Page Object Model, or POM, is meant to organize code for pages to be manageable and maintainable. VL's POMs will be implemented using Page Resource files so that they are easy to view and edit on Robot Framework. 
---

## Test Rail Integration Details

https://github.com/ATEME/robotframework-testrail

Need to install via terminal (e.g. pip3 install colorama): 
colorama>=0.3.9
astroid==1.5.3
coverage==4.4.1
isort==4.2.15
lazy-object-proxy==1.3.1
mccabe==0.6.1
py==1.10.0
pylint==1.7.2
pytest==3.1.3
pytest-cov==2.5.1
six==1.10.0
wrapt==1.10.10
yapf==0.16.3

important files: robotframework2testrail.py, testrail.py, testrail_utils.py, testrail.cfg

Steps to run tests and publish the results in Testrail
1. Run test cases with the command below. It will create a new 'results' folder with results files (log.html, output.xml, report.html)
 
robot -d results /Users/anitagagarina/repos/vendorline/tests_suites/Nav_Bar_Not_logged_in_TestSuite/navbar_not_logged_in_test.robot

2. Publish results in Testrail in Test Run #196

python3 robotframework2testrail.py --tr-config=testrail.cfg --tr-run-id=196 results/output.xml

* other usuful commands:
* Dry run
python3 robotframework2testrail.py --tr-config=testrail.cfg --dryrun --tr-run-id=196 output.xml

* Publish in Test Plan #200 and dont publish "blocked" Test Cases in TestRail
python3 robotframework2testrail.py --tr-config=testrail.cfg --tr-plan-id=200 --tr-dont-publish-blocked output.xml

* Publish in Test Plan #200 with version '1.0.2'
python3 robotframework2testrail.py --tr-config=testrail.cfg --tr-plan-id=200 --tr-version=1.0.2 output.xml

* Publish with api key in command line
python3 robotframework2testrail.py --tr-config=testrail.cfg --tr-password azertyazertyqsdfqsdf --tr-plan-id=200 output.xml

## Git Commands 
git branch
git status
git add .
git commit -m "message"

git push -u origin <branchName> 
e.g. 
git push -u origin vendorline-0.2.0