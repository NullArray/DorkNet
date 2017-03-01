# DorkNet
Selenium powered Python script to automate searching the web for vulnerable applications.

DorkNet can take a single dork or a list of dorks as arguments. After the proper command line arguments have been passed, the script will use Selenium and Geckodriver to find the results we want and save them to a textfile for further processing with SQLmap or similar utilities.

## Usage

``git clone https://github.com/NullArray/DorkNet.git
cd DorkNet
python dorknet.py``

The options for the program are as follows.

``
-h, --help              show this help message and exit
-d DORK, --dork DORK    specify the dork you wish to use
-l LIST, --list LIST    specify path to list with dorks
-v, --verbose           toggle verbosity
``

Some examples for clarity.
``
DorkNet.py -h
DorkNet.py -d inurl:show.php?id= -v
DorkNet.py -l /path/to/list.txr --verbose``


### Dependencies

You will need the Mozilla Geckodriver for this to work. - [Geckodriver]https://github.com/mozilla/geckodriver/releases
And Selenium, which you can either get here [Selenium on PyPi]https://pypi.python.org/pypi/selenium/2.7.0 or you can just open up your terminal and type the followig.
``
pip install -U selenium
``
