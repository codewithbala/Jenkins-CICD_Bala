Build Projects with Gradle in Jenkins
This guide will walk you through building projects with Gradle in Jenkins, using the following GitHub repository and branch:

Repository: https://github.com/codewithbala/Jenkins-CICD_bala.git
Branch: 4.5-gradle
This lab has three sub-sections, namely:

Configuring Gradle plugin for Jenkins
Creating a Gradle project
Building a project with Gradle in Jenkins
Note: Gradle plugin is installed by default. In case you don’t have it installed, you can install the same by following the steps :

Gradle Installation on Ubuntu
Before creating a Gradle project, ensure that Gradle is installed on your Ubuntu system. Follow these steps to install Gradle:

Update package lists for upgrades and package dependencies:

sudo apt-get update
Install the required software-properties-common package:

sudo apt-get install software-properties-common
Add the official Gradle PPA (Personal Package Archive) to your system:

sudo add-apt-repository ppa:cwchien/gradle
Update package lists to include the Gradle PPA:

sudo apt-get update
Install Gradle:

sudo apt-get install gradle
Verify the Gradle installation:

gradle -v
Once Gradle is installed, you can proceed with creating a Gradle project as described in the guide.

Gradle Project on Linux Terminal
Create a new directory and navigate to it:

mkdir my_gradle
cd my_gradle/
Initialize the Gradle project:

gradle init --type java-application
Run the Gradle project:

./gradlew run
Step 1: Configuring Gradle plugin for Jenkins
Go to Jenkins dashboard.
Click on Manage Jenkins and select Manage Plugins.
Under the Available tab, select Gradle.
Click on Install without restart and the plugin will be installed.
Click on Manage Jenkins and select Global Tool Configuration.
Scroll down to the Gradle section and click on Add Gradle.
Check the Install automatically box and specify a name for the installation.
Click Save.
Step 2: Creating a Gradle project
Open the terminal.

If you don’t have Gradle installed, run sudo apt-get install gradle command.

Create a new directory and navigate to it:

mkdir gradle-demo  
cd gradle-demo
Step 3: Building a project with Gradle in Jenkins
Go to Jenkins dashboard.

Click on New Item.

Enter a name for your build job.

Select Freestyle project as the build job type.

Click OK.

Scroll down to the Source Code Management section and select Git.

Enter the link to the repository in the field that appears.

Scroll down to the Build section and click on Add build step.

Select Invoke Gradle Script from the drop-down that appears.

In the form, choose the Gradle installation configured in step 1, and enter the tasks you want to run (e.g., clean build) in the Tasks field.

Scroll down to the Post-build Actions tab and click on the Add post-build action button.

From the drop-down, select Email notification and fill the recipient address in the textbox that appears.

Click Save.

Click Build Now in the project window to make sure that the build works. Jenkins will now build your project.

Click on the Build History to view the build results.

Click on the Console Output to view the build logs.
