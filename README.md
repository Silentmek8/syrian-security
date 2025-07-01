# syrian-security
A simple and fast command-line tool to find **CVE Proof-of-Concept (PoC)** exploits directly from **GitHub** using keywords like `wordpress`, `joomla`, `apache`, etc.

=========================

1. Prerequisites

Make sure your system has these tools installed:
bash (usually pre-installed on Linux/macOS)
curl — to fetch data from GitHub API
jq — to parse JSON responses
figlet — to display the banner (optional but recommended)

=========================

2. Install Dependencies

On Debian/Ubuntu:
sudo apt update
sudo apt install curl jq figlet -y

On Fedora:
sudo dnf install curl jq figlet -y

On macOS (using Homebrew):
brew install curl jq figlet


=========================

3. Download the Script
You can download the script manually or clone the GitHub repository (if you upload it there):

Example manual download:

wget https://your-domain-or-github-url/sc.sh
chmod +x sc.sh

=========================

4. Run the Script
Execute the script with:
./sc.sh
Or with bash explicitly:
bash sc.sh
You will see the banner and then be prompted to enter a keyword (e.g., wordpress, apache, etc.).

=========================

5. Usage Example
Enter keyword (e.g. wordpress, apache, joomla): wordpress
The script will show a list of GitHub repositories related to your keyword with CVE exploits PoCs.



