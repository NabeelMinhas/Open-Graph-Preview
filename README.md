# README

# Open Graph Preview By Luna

## Introduction

The Open Graph Previewer is a web application that allows users to test and preview the Open Graph image of any given URL. The Open Graph protocol, developed by Facebook, enables web pages to be displayed richly on major social media platforms. By including specific <meta> tags in the <head> section of a web page, developers can provide properties such as title, type, URL, and image URL for a preview card.

The purpose of the Open Graph Previewer is to simplify the process of testing and previewing Open Graph images for web pages. Users can enter a URL in the provided input field, and the application will process the URL asynchronously to retrieve the associated Open Graph image. The processed URL and its status will be stored for display in the frontend previewer.

## Application Workflow 

Upon user submission of a URL, the application utilizes Sidekiq, a background job processing framework, to asynchronously process the URL. This ensures that the code execution remains non-blocking, allowing the form to be rendered without any delay. Simultaneously, Action Cable, a real-time communication framework, is active to capture the response when the job executes. Leveraging Action Cable, the application dynamically updates the view to reflect the processed results, enabling users to observe the outcome without needing to manually refresh the page. This approach ensures an efficient and seamless user experience by leveraging the power of background job processing and real-time updates through Action Cable

## Key Features

| Feature                  | Explaination                                                                                                        | Tool                          |
| ------------------------ | ----------------------------------------------------------------------------------------------------------- | ----------------------------------- 
| Asynchronous Processing  | The URL processing is done asynchronously, ensuring that the web thread is not blocked by external requests to user-submitted URLs. | Sidekiq, Radis        |
| Data Storage             | The application stores the processed URLs and their status, allowing users to view the images on the same page where they entered the URL. | Postgres       |
| Asynchronous View Update   | The application updates the view in real-time using Action Cable, allowing users to see dynamic changes, such as the retrieval and display of the Open Graph image associated with the URL, providing them with an accurate preview of how the web page will appear on social media platforms | Web Sockets, Action Cable  |

## Installation

To run the project, please execute the following command with elevated privileges:

```bash
  sudo docker-compose build
```
This command will initiate the building process of the Docker containers defined in the Docker Compose file. Make sure you have Docker and Docker Compose installed on your system before running this command.
