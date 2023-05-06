
# Install Maven on Ubuntu and Create a Simple Maven Project

### Previous Branch Details

In the previous branch, we created a simple Java HelloWorld program using the Java command line. You can review the previous branch for more information.

### Clone the Repository and Switch to the `3.1.1-maven-style` Branch

1. Clone the repository to your local machine by running the following command:
```
git clone https://github.com/codewithbala/Jenkins-cicd.git
```
2. Navigate to the cloned repository:
```
cd Jenkins-cicd/
```
3. Switch to the `3.1.1-maven-style` branch by running the following command:

```
git switch 3.1.1-maven-style
```

Now that you have switched to the `3.1.1-maven-style` branch.

# Jenkins Maven Job for GitHub Repository

This guide will walk you through creating a Jenkins Maven job for the following GitHub repository and branch:

- Repository: 
- Branch: maven-project

## Prerequisites

1. Jenkins should be installed and running on your system.
2. Make sure the Maven Integration plugin is installed in Jenkins. If not, navigate to `Manage Jenkins` > `Manage Plugins` > `Available`, search for "Maven Integration plugin" and install it.
3. Configure Maven in Jenkins by navigating to `Manage Jenkins` > `Global Tool Configuration` > `Maven`. Add a Maven installation if not already configured.

## Step-by-Step Guide

1. **Create a new Jenkins job**: Navigate to the Jenkins dashboard, click on `New Item`, select `Maven project`, and enter a name for your job. Click `OK` to create the job.

2. **Configure the GitHub repository**:
   - In the job configuration page, navigate to the `Source Code Management` section.
   - Select `Git` and enter the repository URL: `https://github.com/manikcloud/Jenkins-cicd.git`
   - Enter the branch specifier: `3.1.1-maven-style`

3. **Configure build triggers**: (Optional) If you want to trigger the build automatically, you can set up build triggers in the `Build Triggers` section. For example, you can use the `Poll SCM` option to periodically check the repository for changes.

4. **Configure the Maven build**:
   - In the job configuration page, navigate to the `Build` section.
   - Select the Maven installation from the `Maven Version` dropdown.
   - In the `Goals and options` field, enter the desired Maven goals, e.g., `clean install`.

5. **Configure post-build actions**: (Optional) If you want to perform any post-build actions, such as archiving artifacts or publishing test results, configure them in the `Post-build Actions` section.

6. **Save the job configuration**: Click `Save` to apply the configuration changes.

7. **Build the job**: Click on `Build Now` to start the build process. Monitor the build progress and view the build results in the `Console Output`.

8. **Optional**: If you want to set up webhooks for automatic build triggering, follow the instructions in the GitHub and Jenkins documentation to configure webhooks for your repository and Jenkins instance.



