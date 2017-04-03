# DorkNet
Selenium powered Python script to automate searching the web for vulnerable applications.

DorkNet can take a single dork or a list of dorks as arguments. After the proper command line arguments have been passed, the script will use Selenium and Geckodriver to find the results we want and save them to a textfile for further processing with SQLmap or similar utilities.

### Note
I have included the ability to proxy the connection of the web driver if desired. Simply provide the proxy IP and PORT when the dialog comes up.

## Usage

```
git clone https://github.com/NullArray/DorkNet.git
cd DorkNet
python dorknet.py
```

The options for the program are as follows.

```
-h, --help              show this help message and exit
-d DORK, --dork DORK    specify the dork you wish to use
-l LIST, --list LIST    specify path to list with dorks
-v, --verbose           toggle verbosity
```

Some examples for clarity.

```
DorkNet.py -h
DorkNet.py -d inurl:show.php?id= -v
DorkNet.py -l /path/to/list.txt --verbose
```

### Dependencies

You will need the Mozilla [Geckodriver](https://github.com/mozilla/geckodriver/releases) for this to work. After it has been installed feel free to use the requirements file i made for this program

```pip install -r requirements.txt```

### Known Issue
By using Selenium and Geckodriver, DorkNet is effective at emulating a regular browser. In this manner the program is able to avoid captchas most of the time. However on limited occasions, Google throws one regardless. The same sometimes happens when manually searching for strings that look like a dork. Should you encounter one, you can just fill out the captcha in the Geckodriver and DorkNet will continue it's normal operation.
